"""Output swing assessment from DC Vcmd sweep, nominally -4.5 to +4.5 V.

The source testbench defines closed-loop input drive, output common mode,
tracking error, and four MOS saturation margin vectors. The valid swing
returned here is the contiguous range containing Vcmd=0 satisfying:
  |Vout_diff - Vcmd| <= 10 mV
  all four device margins >= 0 V.
These limits are characterization defaults, NOT user-approved signoff specs.
All samples remain available in the per-run .data file.
"""
import math

COLUMNS = ("vcmd", "voutp", "voutn", "vod", "vocm", "tracking_error",
           "sat_xm6", "sat_xm7", "sat_xm8", "sat_xm10")
TRACKING_LIMIT_V = 0.010
SAT_LIMIT_V = 0.0


def postprocess(results: dict, conditions: dict) -> dict:
    series = {}
    for key in COLUMNS:
        if key not in results:
            raise ValueError(f"output_swing: missing column {key}")
        series[key] = [float(x) for x in results[key]]
    lengths = set(map(len, series.values()))
    if len(lengths) != 1 or not lengths.pop():
        raise ValueError("output_swing: inconsistent/empty sweep columns")
    rows = sorted(zip(*(series[k] for k in COLUMNS)), key=lambda r: r[0])
    if any(not all(math.isfinite(x) for x in row) for row in rows):
        raise ValueError("output_swing: non-finite sweep value")
    idx = min(range(len(rows)), key=lambda i: abs(rows[i][0]))
    if abs(rows[idx][0]) > 0.0026:
        raise ValueError("output_swing: zero-command point missing from sweep")
    def valid(row):
        return (abs(row[5]) <= TRACKING_LIMIT_V and
                min(row[6:10]) >= SAT_LIMIT_V)
    if not valid(rows[idx]):
        raise ValueError("output_swing: zero-command bias fails tracking/saturation criteria")
    lo = hi = idx
    while lo > 0 and valid(rows[lo - 1]):
        lo -= 1
    while hi + 1 < len(rows) and valid(rows[hi + 1]):
        hi += 1
    # Preserve original gross extrema, plus the new valid closed-loop range.
    def ret(x): return [float(x)]
    return {
        "vod_min_raw": ret(min(r[3] for r in rows)),
        "vod_max_raw": ret(max(r[3] for r in rows)),
        "voutp_pp_raw": ret(max(r[1] for r in rows)-min(r[1] for r in rows)),
        "voutn_pp_raw": ret(max(r[2] for r in rows)-min(r[2] for r in rows)),
        "swing_min": ret(rows[lo][3]),
        "swing_max": ret(rows[hi][3]),
        "swing_pp": ret(rows[hi][3]-rows[lo][3]),
        "tracking_error_max": ret(max(abs(r[5]) for r in rows[lo:hi+1])),
        "voutcm_min": ret(min(r[4] for r in rows[lo:hi+1])),
        "voutcm_max": ret(max(r[4] for r in rows[lo:hi+1])),
    }
