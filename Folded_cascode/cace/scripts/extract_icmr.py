"""CACE per-run ICMR extraction, reproducing top_extract_icmr.py logic.

The raw .data file contains a pair (VCM, gain_dB) per 10 mV point.
The valid range is the contiguous >= -3 dB region containing VCM=2.5 V.
"""
import math


def postprocess(results: dict, conditions: dict) -> dict:
    vcm = [float(x) for x in results["vcm"]]
    gain = [float(x) for x in results["gain_db"]]
    points = sorted((v, g) for v, g in zip(vcm, gain)
                    if math.isfinite(v) and math.isfinite(g))
    if not points:
        raise ValueError("ICMR: no valid gain-vs-VCM points")

    vs, gs = zip(*points)
    nominal_vcm = 2.5
    i = min(range(len(vs)), key=lambda j: abs(vs[j] - nominal_vcm))
    if abs(vs[i] - nominal_vcm) > 0.0051:
        raise ValueError("ICMR: VCM=2.5 V nominal sample is absent")
    gain_nom = gs[i]
    threshold = gain_nom - 3.0
    left = i
    right = i
    while left > 0 and gs[left - 1] >= threshold:
        left -= 1
    while right < len(vs) - 1 and gs[right + 1] >= threshold:
        right += 1
    return {
        "icmr_min": [vs[left]],
        "icmr_max": [vs[right]],
        "icmr_span": [vs[right] - vs[left]],
        "gain_nom": [gain_nom],
    }
