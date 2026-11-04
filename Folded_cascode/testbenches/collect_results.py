#!/usr/bin/env python3

from pathlib import Path
import re
import numpy as np


# ============================================================
# PATHS
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent
SIM_DIR = SCRIPT_DIR / "simulation"

OUTPUT_TXT = SIM_DIR / "characterization_summary.txt"
OUTPUT_CSV = SIM_DIR / "characterization_summary.csv"


# ============================================================
# HELPERS
# ============================================================

def read_text(path):
    path = Path(path)

    if not path.is_file():
        return ""

    return path.read_text(errors="ignore")


def search_value(text, patterns):
    """
    Search several regular-expression patterns and return
    the first floating-point value found.
    """

    for pattern in patterns:

        match = re.search(
            pattern,
            text,
            flags=re.IGNORECASE | re.MULTILINE
        )

        if match:
            try:
                return float(match.group(1))
            except (ValueError, IndexError):
                pass

    return None


def add_result(
    results,
    category,
    parameter,
    value,
    unit="",
    comment=""
):
    results.append(
        {
            "category": category,
            "parameter": parameter,
            "value": value,
            "unit": unit,
            "comment": comment,
        }
    )


# ============================================================
# LOAD LOGS
# ============================================================

ac_log = read_text(
    SIM_DIR / "fc_cmfb_ac_tb.log"
)

stb_log = read_text(
    SIM_DIR / "fc_cmfb_stb_tb.log"
)

psrrp_log = read_text(
    SIM_DIR / "fc_cmfb_psrrp_tb.log"
)

psrrn_log = read_text(
    SIM_DIR / "fc_cmfb_psrrn_tb.log"
)

cmrr_log = read_text(
    SIM_DIR / "fc_cmfb_cmrr_tb.log"
)

slew_log = read_text(
    SIM_DIR / "fc_cmfb_slew_rate_tb.log"
)

power_log = read_text(
    SIM_DIR / "fc_cmfb_power_tb.log"
)

icmr_log = read_text(
    SIM_DIR / "fc_cmfb_icmr_tb_postprocess.log"
)

swing_log = read_text(
    SIM_DIR / "fc_cmfb_output_swing_tb_postprocess.log"
)

noise_log = read_text(
    SIM_DIR / "fc_cmfb_noise_tb_postprocess.log"
)

settling_log = read_text(
    SIM_DIR / "fc_cmfb_settling_tb_postprocess.log"
)


# ============================================================
# RESULTS CONTAINER
# ============================================================

results = []


# ============================================================
# AC PERFORMANCE
# ============================================================

dc_gain = search_value(
    ac_log,
    [
        r"gain_dc\s*=\s*([-+0-9.eE]+)",
        r"dc[_ ]?gain\s*=\s*([-+0-9.eE]+)",
    ]
)


ugf_hz = search_value(
    ac_log,
    [
        r"\bfu\s*=\s*([-+0-9.eE]+)",
        r"\bugf\s*=\s*([-+0-9.eE]+)",
        r"unity[_ ]?gain.*?=\s*([-+0-9.eE]+)",
        r"unity.*?frequency.*?=\s*([-+0-9.eE]+)",
    ]
)


ugf_mhz = None

if ugf_hz is not None:
    ugf_mhz = ugf_hz / 1e6


phase_fu = search_value(
    ac_log,
    [
        r"phase_fu\s*=\s*([-+0-9.eE]+)",
    ]
)


phase_margin = None

if phase_fu is not None:
    phase_margin = 180.0 + phase_fu


add_result(
    results,
    "AC",
    "DC Gain",
    dc_gain,
    "dB"
)

add_result(
    results,
    "AC",
    "Unity-Gain Frequency",
    ugf_mhz,
    "MHz"
)

add_result(
    results,
    "AC",
    "Phase Margin",
    phase_margin,
    "deg"
)


# ============================================================
# STABILITY / CMFB LOOP
# ============================================================

crossover1 = search_value(
    stb_log,
    [
        r"ugf1\s*=\s*([-+0-9.eE]+)",
        r"crossover1\s*=\s*([-+0-9.eE]+)",
        r"cross.*?1.*?=\s*([-+0-9.eE]+)",
    ]
)


pm1 = search_value(
    stb_log,
    [
        r"\bpm1\s*=\s*([-+0-9.eE]+)",
    ]
)


add_result(
    results,
    "Stability",
    "CMFB Crossover 1",
    crossover1,
    "Hz"
)

add_result(
    results,
    "Stability",
    "CMFB Phase Margin 1",
    pm1,
    "deg"
)


# ============================================================
# ICMR
# ============================================================

icmr_min = search_value(
    icmr_log,
    [
        r"ICMR minimum\s*:\s*([-+0-9.eE]+)\s*V",
        r"ICMR min.*?([-+0-9.eE]+)\s*V",
    ]
)


icmr_max = search_value(
    icmr_log,
    [
        r"ICMR maximum\s*:\s*([-+0-9.eE]+)\s*V",
        r"ICMR max.*?([-+0-9.eE]+)\s*V",
    ]
)


icmr_gain = search_value(
    icmr_log,
    [
        r"Nominal gain.*?([-+0-9.eE]+)\s*dB",
        r"gain.*?2\.5.*?([-+0-9.eE]+)\s*dB",
    ]
)


add_result(
    results,
    "Input",
    "ICMR Minimum",
    icmr_min,
    "V"
)

add_result(
    results,
    "Input",
    "ICMR Maximum",
    icmr_max,
    "V"
)

add_result(
    results,
    "Input",
    "Gain at VCM = 2.5 V",
    icmr_gain,
    "dB"
)


# ============================================================
# OUTPUT SWING
# ============================================================

diff_swing = search_value(
    swing_log,
    [
        r"Vod swing\s*:\s*([-+0-9.eE]+)\s*Vpp",
        r"Differential swing.*?([-+0-9.eE]+)\s*Vpp",
        r"Differential output swing.*?([-+0-9.eE]+)",
    ]
)


vod_min = search_value(
    swing_log,
    [
        r"Vod minimum\s*:\s*([-+0-9.eE]+)\s*V",
        r"Differential output min.*?([-+0-9.eE]+)",
    ]
)


vod_max = search_value(
    swing_log,
    [
        r"Vod maximum\s*:\s*([-+0-9.eE]+)\s*V",
        r"Differential output max.*?([-+0-9.eE]+)",
    ]
)


if (
    diff_swing is None
    and vod_min is not None
    and vod_max is not None
):
    diff_swing = vod_max - vod_min


add_result(
    results,
    "Output",
    "Differential Output Swing",
    diff_swing,
    "Vpp"
)

add_result(
    results,
    "Output",
    "Differential Output Minimum",
    vod_min,
    "V"
)

add_result(
    results,
    "Output",
    "Differential Output Maximum",
    vod_max,
    "V"
)


# ============================================================
# SLEW RATE
# ============================================================

sr_pos = search_value(
    slew_log,
    [
        r"sr_rise_10_90_vus\s*=\s*([-+0-9.eE]+)",
        r"sr_pos_vus\s*=\s*([-+0-9.eE]+)",
    ]
)


sr_neg = search_value(
    slew_log,
    [
        r"sr_fall_90_10_vus\s*=\s*([-+0-9.eE]+)",
        r"sr_neg_vus\s*=\s*([-+0-9.eE]+)",
    ]
)


add_result(
    results,
    "Transient",
    "Slew Rate +",
    sr_pos,
    "V/us"
)

add_result(
    results,
    "Transient",
    "Slew Rate -",
    sr_neg,
    "V/us"
)


# ============================================================
# SETTLING TIME
# ============================================================

settle_1_block = re.search(
    r"1%\s+settling(.*?)(?=0\.1%\s+settling)",
    settling_log,
    flags=re.IGNORECASE | re.DOTALL
)


settle_01_block = re.search(
    r"0\.1%\s+settling(.*?)(?=Overshoot|Output common-mode|$)",
    settling_log,
    flags=re.IGNORECASE | re.DOTALL
)


settle_1_pos = None
settle_1_neg = None

settle_01_pos = None
settle_01_neg = None


if settle_1_block:

    block = settle_1_block.group(1)

    settle_1_pos = search_value(
        block,
        [
            r"Positive settling\s*:\s*([-+0-9.eE]+)\s*ns"
        ]
    )

    settle_1_neg = search_value(
        block,
        [
            r"Negative settling\s*:\s*([-+0-9.eE]+)\s*ns"
        ]
    )


if settle_01_block:

    block = settle_01_block.group(1)

    settle_01_pos = search_value(
        block,
        [
            r"Positive settling\s*:\s*([-+0-9.eE]+)\s*ns"
        ]
    )

    settle_01_neg = search_value(
        block,
        [
            r"Negative settling\s*:\s*([-+0-9.eE]+)\s*ns"
        ]
    )


settle_1 = None

if (
    settle_1_pos is not None
    and settle_1_neg is not None
):
    settle_1 = max(
        settle_1_pos,
        settle_1_neg
    )


settle_01 = None

if (
    settle_01_pos is not None
    and settle_01_neg is not None
):
    settle_01 = max(
        settle_01_pos,
        settle_01_neg
    )


add_result(
    results,
    "Transient",
    "Settling Time 1%",
    settle_1,
    "ns"
)

add_result(
    results,
    "Transient",
    "Settling Time 0.1%",
    settle_01,
    "ns"
)


# ============================================================
# NOISE
# ============================================================

noise_1k = search_value(
    noise_log,
    [
        r"1e\+03\s+Hz\s*:\s*([-+0-9.eE]+)\s*nV/sqrt\(Hz\)",
        r"1000\s+Hz\s*:\s*([-+0-9.eE]+)\s*nV/sqrt\(Hz\)",
    ]
)


noise_floor = search_value(
    noise_log,
    [
        r"Noise floor\s*:\s*([-+0-9.eE]+)\s*nV/sqrt\(Hz\)",
    ]
)


flicker_corner = search_value(
    noise_log,
    [
        r"Approx\.\s*1/f corner\s*:\s*([-+0-9.eE]+)\s*Hz",
    ]
)


integrated_input_noise = search_value(
    noise_log,
    [
        r"Input noise RMS\s*:\s*([-+0-9.eE]+)\s*uV_rms",
    ]
)


add_result(
    results,
    "Noise",
    "Input Noise @ 1 kHz",
    noise_1k,
    "nV/sqrtHz"
)

add_result(
    results,
    "Noise",
    "Broadband Input Noise",
    noise_floor,
    "nV/sqrtHz"
)

add_result(
    results,
    "Noise",
    "1/f Corner",
    flicker_corner,
    "Hz"
)

add_result(
    results,
    "Noise",
    "Integrated Input Noise",
    integrated_input_noise,
    "uVrms",
    "1 Hz - 100 MHz"
)


# ============================================================
# POWER
# ============================================================

i_ota = search_value(
    power_log,
    [
        r"i_ota_ua\s*=\s*([-+0-9.eE]+)"
    ]
)


i_cmfb = search_value(
    power_log,
    [
        r"i_cmfb_ua\s*=\s*([-+0-9.eE]+)"
    ]
)


i_total = search_value(
    power_log,
    [
        r"i_total_ua\s*=\s*([-+0-9.eE]+)"
    ]
)


p_ota = search_value(
    power_log,
    [
        r"p_ota_mw\s*=\s*([-+0-9.eE]+)"
    ]
)


p_cmfb = search_value(
    power_log,
    [
        r"p_cmfb_mw\s*=\s*([-+0-9.eE]+)"
    ]
)


p_total = search_value(
    power_log,
    [
        r"p_total_mw\s*=\s*([-+0-9.eE]+)"
    ]
)


add_result(
    results,
    "Power",
    "OTA Current",
    i_ota,
    "uA"
)

add_result(
    results,
    "Power",
    "CMFB Current",
    i_cmfb,
    "uA"
)

add_result(
    results,
    "Power",
    "Total Current",
    i_total,
    "uA"
)

add_result(
    results,
    "Power",
    "OTA Power",
    p_ota,
    "mW"
)

add_result(
    results,
    "Power",
    "CMFB Power",
    p_cmfb,
    "mW"
)

add_result(
    results,
    "Power",
    "Total Power",
    p_total,
    "mW"
)


# ============================================================
# OFFSET MONTE CARLO
# ============================================================

vos_file = SIM_DIR / "vos_mc_numeric.txt"

offset_mean = None
offset_sigma = None
offset_3sigma = None
offset_min = None
offset_max = None


if vos_file.is_file():

    try:

        vos = np.atleast_1d(
            np.loadtxt(vos_file)
        )

        if vos.size > 0:

            offset_mean = (
                np.mean(vos) * 1e3
            )

            offset_sigma = (
                np.std(vos, ddof=1) * 1e3
                if vos.size > 1
                else 0.0
            )

            offset_3sigma = (
                3.0 * offset_sigma
            )

            offset_min = (
                np.min(vos) * 1e3
            )

            offset_max = (
                np.max(vos) * 1e3
            )

    except Exception:
        pass


add_result(
    results,
    "Mismatch",
    "Offset Mean",
    offset_mean,
    "mV"
)

add_result(
    results,
    "Mismatch",
    "Offset Sigma",
    offset_sigma,
    "mV"
)

add_result(
    results,
    "Mismatch",
    "Offset 3 Sigma",
    offset_3sigma,
    "mV"
)

add_result(
    results,
    "Mismatch",
    "Offset Minimum",
    offset_min,
    "mV"
)

add_result(
    results,
    "Mismatch",
    "Offset Maximum",
    offset_max,
    "mV"
)


# ============================================================
# WRITE TEXT SUMMARY
# ============================================================

lines = []

lines.append(
    "=" * 78
)

lines.append(
    "GF180 FULLY DIFFERENTIAL FOLDED-CASCODE OTA"
)

lines.append(
    "NOMINAL CHARACTERIZATION SUMMARY"
)

lines.append(
    "=" * 78
)

lines.append("")


current_category = None


for item in results:

    category = item["category"]

    if category != current_category:

        if current_category is not None:
            lines.append("")

        lines.append(
            f"[{category}]"
        )

        current_category = category


    parameter = item["parameter"]
    value = item["value"]
    unit = item["unit"]
    comment = item["comment"]


    if value is None:

        value_str = "N/A"

    else:

        value_str = (
            f"{value:.4f}"
        )

        if unit:
            value_str += f" {unit}"


    if comment:
        value_str += f" ({comment})"


    lines.append(
        f"{parameter:<34} : {value_str}"
    )


lines.append("")

lines.append(
    "=" * 78
)

lines.append(
    "N/A means that the corresponding value was not found "
    "in the generated simulation/post-processing logs."
)

lines.append(
    "=" * 78
)


OUTPUT_TXT.write_text(
    "\n".join(lines) + "\n"
)


# ============================================================
# WRITE CSV SUMMARY
# ============================================================

csv_lines = [
    "Category,Parameter,Value,Unit,Comment"
]


for item in results:

    value = (
        ""
        if item["value"] is None
        else f"{item['value']:.12g}"
    )


    csv_lines.append(
        ",".join(
            [
                item["category"],
                item["parameter"],
                value,
                item["unit"],
                item["comment"],
            ]
        )
    )


OUTPUT_CSV.write_text(
    "\n".join(csv_lines) + "\n"
)


# ============================================================
# TERMINAL OUTPUT
# ============================================================

print()

print(
    "\n".join(lines)
)

print()

print(
    "Characterization summary saved to:"
)

print(
    f"  {OUTPUT_TXT}"
)

print()

print(
    "CSV summary saved to:"
)

print(
    f"  {OUTPUT_CSV}"
)

print()
