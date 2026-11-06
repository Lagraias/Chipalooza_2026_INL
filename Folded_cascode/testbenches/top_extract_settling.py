#!/usr/bin/env python3

from pathlib import Path
import os

import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# Paths
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent
SIM_DIR = Path(os.environ.get("TOP_SIM_DIR", SCRIPT_DIR / "simulation"))

INPUT_FILE = SIM_DIR / "settling.dat"

PLOT_1PCT = SIM_DIR / "settling_time_1pct.png"
PLOT_01PCT = SIM_DIR / "settling_time_0p1pct.png"


# ============================================================
# Settings
# ============================================================

RISE_START = 5e-6
FALL_START = 25e-6

RISE_END = 25e-6
FALL_END = 45e-6

TOLERANCES = {
    "1%": 0.01,
    "0.1%": 0.001,
}


# ============================================================
# Load data
#
# Expected columns:
#
# time
# Vcmd
# Vod
# Voutp
# Voutn
# Vocm
# tracking_error
# ============================================================

if not INPUT_FILE.is_file():
    raise SystemExit(
        f"ERROR: input file not found:\n"
        f"  {INPUT_FILE}"
    )

data = np.genfromtxt(
    INPUT_FILE,
    skip_header=1,
    dtype=float
)

if data.ndim == 1:
    data = data.reshape(1, -1)

data = data[np.all(np.isfinite(data), axis=1)]

if data.shape[1] != 7:
    raise SystemExit(
        f"ERROR: expected 7 columns, found {data.shape[1]}"
    )


time = data[:, 0]
vcmd = data[:, 1]
vod = data[:, 2]
voutp = data[:, 3]
voutn = data[:, 4]
vocm = data[:, 5]
tracking_error = data[:, 6]


# ============================================================
# Helper functions
# ============================================================

def region(t_start, t_end):
    return (time >= t_start) & (time < t_end)


def final_value(mask, fraction=0.10):
    """
    Average the final 10% of a selected time window.
    """

    indices = np.where(mask)[0]

    if len(indices) == 0:
        raise RuntimeError("Empty time region")

    n = max(5, int(len(indices) * fraction))

    final_indices = indices[-n:]

    return np.mean(vod[final_indices])


def calculate_settling(
    t_start,
    t_end,
    target,
    tolerance_fraction,
    step_amplitude
):
    """
    Settling time = first point after which the output
    remains inside the tolerance band until the next step.
    """

    mask = region(t_start, t_end)

    idx = np.where(mask)[0]

    tolerance = tolerance_fraction * step_amplitude

    error = np.abs(vod[idx] - target)

    outside = error > tolerance

    if not np.any(outside):
        settle_idx = idx[0]
    else:
        last_bad_local = np.where(outside)[0][-1]

        if last_bad_local >= len(idx) - 1:
            return None, tolerance

        settle_idx = idx[last_bad_local + 1]

    settling_time = time[settle_idx] - t_start

    return settling_time, tolerance


# ============================================================
# Determine actual steady-state levels
# ============================================================

low_before = np.mean(
    vod[
        (time >= 2e-6)
        & (time < 4.5e-6)
    ]
)

high_final = final_value(
    region(RISE_START, RISE_END)
)

low_final = final_value(
    region(FALL_START, FALL_END)
)


rise_amplitude = abs(
    high_final - low_before
)

fall_amplitude = abs(
    high_final - low_final
)


# ============================================================
# Calculate settling times
# ============================================================

results = {}

for name, tol in TOLERANCES.items():

    rise_ts, rise_band = calculate_settling(
        RISE_START,
        RISE_END,
        high_final,
        tol,
        rise_amplitude
    )

    fall_ts, fall_band = calculate_settling(
        FALL_START,
        FALL_END,
        low_final,
        tol,
        fall_amplitude
    )

    results[name] = {
        "rise_ts": rise_ts,
        "fall_ts": fall_ts,
        "rise_band": rise_band,
        "fall_band": fall_band,
    }


# ============================================================
# Overshoot / undershoot
# ============================================================

rise_mask = region(
    RISE_START,
    RISE_END
)

fall_mask = region(
    FALL_START,
    FALL_END
)

rise_peak = np.max(
    vod[rise_mask]
)

fall_min = np.min(
    vod[fall_mask]
)


rise_overshoot = (
    rise_peak - high_final
)

fall_undershoot = (
    low_final - fall_min
)


rise_overshoot_pct = (
    100
    * rise_overshoot
    / rise_amplitude
)

fall_undershoot_pct = (
    100
    * fall_undershoot
    / fall_amplitude
)


# ============================================================
# Common-mode transient
# ============================================================

vocm_initial = np.mean(
    vocm[
        (time >= 2e-6)
        & (time < 4.5e-6)
    ]
)

vocm_peak = np.max(vocm)
vocm_min = np.min(vocm)

vocm_positive_excursion = (
    vocm_peak - vocm_initial
)

vocm_negative_excursion = (
    vocm_initial - vocm_min
)


# ============================================================
# Print results
# ============================================================

print()
print("==================================================")
print("Settling Time Analysis")
print("==================================================")
print()

print("Steady-state differential output:")
print()

print(
    f"Initial low level   : "
    f"{low_before:.6f} V"
)

print(
    f"High level          : "
    f"{high_final:.6f} V"
)

print(
    f"Final low level     : "
    f"{low_final:.6f} V"
)

print()

print(
    f"Rise amplitude      : "
    f"{rise_amplitude:.6f} V"
)

print(
    f"Fall amplitude      : "
    f"{fall_amplitude:.6f} V"
)

print()


for name in ["1%", "0.1%"]:

    result = results[name]

    print("--------------------------------------------------")
    print(f"{name} settling")
    print("--------------------------------------------------")

    if result["rise_ts"] is not None:

        print(
            f"Positive settling   : "
            f"{result['rise_ts']*1e9:.3f} ns"
        )

    else:

        print(
            "Positive settling   : "
            "not settled"
        )

    if result["fall_ts"] is not None:

        print(
            f"Negative settling   : "
            f"{result['fall_ts']*1e9:.3f} ns"
        )

    else:

        print(
            "Negative settling   : "
            "not settled"
        )

    print(
        f"Positive tolerance  : "
        f"±{result['rise_band']*1e3:.3f} mV"
    )

    print(
        f"Negative tolerance  : "
        f"±{result['fall_band']*1e3:.3f} mV"
    )

    print()


print("--------------------------------------------------")
print("Overshoot / undershoot")
print("--------------------------------------------------")

print(
    f"Positive overshoot  : "
    f"{rise_overshoot*1e3:.3f} mV "
    f"({rise_overshoot_pct:.3f} %)"
)

print(
    f"Negative undershoot : "
    f"{fall_undershoot*1e3:.3f} mV "
    f"({fall_undershoot_pct:.3f} %)"
)

print()


print("--------------------------------------------------")
print("Output common-mode transient")
print("--------------------------------------------------")

print(
    f"Steady-state Vocm   : "
    f"{vocm_initial:.6f} V"
)

print(
    f"Maximum Vocm        : "
    f"{vocm_peak:.6f} V"
)

print(
    f"Minimum Vocm        : "
    f"{vocm_min:.6f} V"
)

print(
    f"Positive excursion  : "
    f"{vocm_positive_excursion*1e3:.3f} mV"
)

print(
    f"Negative excursion  : "
    f"{vocm_negative_excursion*1e3:.3f} mV"
)

print()
print("==================================================")
print()


# ============================================================
# Plot function
# ============================================================

def make_plot(
    tolerance_name,
    tolerance_fraction,
    filename
):

    rise_band = (
        tolerance_fraction
        * rise_amplitude
    )

    fall_band = (
        tolerance_fraction
        * fall_amplitude
    )

    fig, ax = plt.subplots(
        figsize=(9, 5)
    )

    ax.plot(
        time * 1e6,
        vod,
        label="Vod"
    )

    ax.plot(
        time * 1e6,
        vcmd,
        linestyle="--",
        label="Vcmd"
    )

    ax.axhline(
        high_final + rise_band,
        linestyle=":"
    )

    ax.axhline(
        high_final - rise_band,
        linestyle=":"
    )

    ax.axhline(
        low_final + fall_band,
        linestyle=":"
    )

    ax.axhline(
        low_final - fall_band,
        linestyle=":"
    )

    rise_ts = results[
        tolerance_name
    ]["rise_ts"]

    fall_ts = results[
        tolerance_name
    ]["fall_ts"]

    if rise_ts is not None:

        ax.axvline(
            (RISE_START + rise_ts)
            * 1e6,
            linestyle="--",
            label=(
                f"Rise settle = "
                f"{rise_ts*1e9:.1f} ns"
            )
        )

    if fall_ts is not None:

        ax.axvline(
            (FALL_START + fall_ts)
            * 1e6,
            linestyle="--",
            label=(
                f"Fall settle = "
                f"{fall_ts*1e9:.1f} ns"
            )
        )

    ax.set_xlabel(
        "Time [us]"
    )

    ax.set_ylabel(
        "Differential output [V]"
    )

    ax.set_title(
        f"Differential Settling Time "
        f"({tolerance_name})"
    )

    ax.grid(True)

    ax.legend()

    fig.tight_layout()

    fig.savefig(
        filename,
        dpi=300,
        bbox_inches="tight"
    )


# ============================================================
# Generate plots
# ============================================================

make_plot(
    "1%",
    0.01,
    PLOT_1PCT
)

make_plot(
    "0.1%",
    0.001,
    PLOT_01PCT
)


print("Plots saved to:")
print()

print(
    f"  {PLOT_1PCT}"
)

print(
    f"  {PLOT_01PCT}"
)

print()

plt.show()
