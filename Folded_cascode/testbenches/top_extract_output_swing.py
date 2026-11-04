#!/usr/bin/env python3

from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# Paths
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent
SIM_DIR = SCRIPT_DIR / "simulation" / "top_regression"

INPUT_FILE = SIM_DIR / "output_swing.dat"

OUTPUT_PLOT = SIM_DIR / "output_swing.png"
MARGIN_PLOT = SIM_DIR / "output_swing_saturation_margin.png"
ERROR_PLOT = SIM_DIR / "output_swing_errors.png"


# ============================================================
# User settings
# ============================================================

VCM_TARGET = 2.5

# Maximum allowed differential tracking error
TRACKING_TOL = 10e-3       # 10 mV

# Maximum allowed output common-mode error
VOCM_TOL = 100e-3          # 100 mV


# ============================================================
# Check input file
# ============================================================

if not INPUT_FILE.is_file():
    raise SystemExit(
        f"\nERROR: input file not found:\n"
        f"  {INPUT_FILE}\n\n"
        f"Run the output-swing simulation first.\n"
    )


# ============================================================
# Read ngspice wrdata file
#
# The first row contains vector names because the ngspice
# control block uses:
#
#     set wr_vecnames
#
# Therefore the first row must be skipped.
# ============================================================

try:

    data = np.genfromtxt(
        INPUT_FILE,
        skip_header=1,
        dtype=float
    )

except Exception as error:

    raise SystemExit(
        f"\nERROR reading:\n"
        f"  {INPUT_FILE}\n\n"
        f"{error}\n"
    )


# ============================================================
# Basic data checks
# ============================================================

if data.ndim == 1:
    data = data.reshape(1, -1)

if data.ndim != 2:
    raise SystemExit(
        f"\nERROR: unexpected data format in:\n"
        f"  {INPUT_FILE}\n"
    )


# Remove rows containing NaN or infinity

data = data[
    np.all(
        np.isfinite(data),
        axis=1
    )
]


if len(data) == 0:
    raise SystemExit(
        "\nERROR: no valid numeric data found.\n"
    )


print()
print("==================================================")
print("Input data")
print("==================================================")
print(f"File             : {INPUT_FILE}")
print(f"Number of rows   : {data.shape[0]}")
print(f"Number of columns: {data.shape[1]}")
print()


# ============================================================
# Expected wrdata format
#
# With:
#
# set wr_singlescale
#
# wrdata output_swing.dat \
#     v(voutp) \
#     v(voutn) \
#     vod \
#     vocm \
#     tracking_error \
#     sat_xm6 \
#     sat_xm7 \
#     sat_xm8 \
#     sat_xm10
#
# Expected columns:
#
#  0 : Vcmd
#  1 : Voutp
#  2 : Voutn
#  3 : Vod
#  4 : Vocm
#  5 : tracking_error
#  6 : sat_xm6
#  7 : sat_xm7
#  8 : sat_xm8
#  9 : sat_xm10
# ============================================================

EXPECTED_COLUMNS = 10


if data.shape[1] != EXPECTED_COLUMNS:

    raise SystemExit(
        "\nERROR: unexpected number of columns in "
        "output_swing.dat.\n\n"
        f"Expected : {EXPECTED_COLUMNS}\n"
        f"Found    : {data.shape[1]}\n\n"
        "Check the first lines with:\n\n"
        "  head -3 simulation/output_swing.dat\n"
    )


# ============================================================
# Assign columns
# ============================================================

vcmd = data[:, 0]

voutp = data[:, 1]
voutn = data[:, 2]

vod = data[:, 3]
vocm = data[:, 4]

tracking_error = data[:, 5]

sat_xm6 = data[:, 6]
sat_xm7 = data[:, 7]
sat_xm8 = data[:, 8]
sat_xm10 = data[:, 9]


# ============================================================
# Sort data by Vcmd
#
# Normally ngspice already writes it in increasing order,
# but sorting makes the post-processing more robust.
# ============================================================

order = np.argsort(vcmd)

vcmd = vcmd[order]

voutp = voutp[order]
voutn = voutn[order]

vod = vod[order]
vocm = vocm[order]

tracking_error = tracking_error[order]

sat_xm6 = sat_xm6[order]
sat_xm7 = sat_xm7[order]
sat_xm8 = sat_xm8[order]
sat_xm10 = sat_xm10[order]


# ============================================================
# Output common-mode error
# ============================================================

vocm_error = vocm - VCM_TARGET


# ============================================================
# Criterion 1:
# Output transistors must remain in saturation
#
# |VDS| - |VDSAT| >= 0
# ============================================================

valid_sat = (
    (sat_xm6 >= 0.0)
    & (sat_xm7 >= 0.0)
    & (sat_xm8 >= 0.0)
    & (sat_xm10 >= 0.0)
)


# ============================================================
# Criterion 2:
# Differential output must track Vcmd
#
# |Vod - Vcmd| <= TRACKING_TOL
# ============================================================

valid_tracking = (
    np.abs(tracking_error)
    <= TRACKING_TOL
)


# ============================================================
# Criterion 3:
# Output common-mode must remain near target
#
# |Vocm - VCM_TARGET| <= VOCM_TOL
# ============================================================

valid_vocm = (
    np.abs(vocm_error)
    <= VOCM_TOL
)


# ============================================================
# Combined criterion
# ============================================================

valid = (
    valid_sat
    & valid_tracking
    & valid_vocm
)


# ============================================================
# Find point closest to Vcmd = 0
# ============================================================

idx_zero = np.argmin(
    np.abs(vcmd)
)


# ============================================================
# Check nominal point
# ============================================================

if not valid[idx_zero]:

    print()
    print("==================================================")
    print("ERROR: nominal operating point is not valid")
    print("==================================================")
    print()

    print(f"Vcmd            : {vcmd[idx_zero]:.6f} V")
    print(f"Vod             : {vod[idx_zero]:.6f} V")

    print(
        f"Tracking error  : "
        f"{tracking_error[idx_zero]*1e3:.3f} mV"
    )

    print(
        f"Vocm            : "
        f"{vocm[idx_zero]:.6f} V"
    )

    print(
        f"Vocm error      : "
        f"{vocm_error[idx_zero]*1e3:.3f} mV"
    )

    print()

    print(
        f"XM6 margin      : "
        f"{sat_xm6[idx_zero]:.6f} V"
    )

    print(
        f"XM7 margin      : "
        f"{sat_xm7[idx_zero]:.6f} V"
    )

    print(
        f"XM8 margin      : "
        f"{sat_xm8[idx_zero]:.6f} V"
    )

    print(
        f"XM10 margin     : "
        f"{sat_xm10[idx_zero]:.6f} V"
    )

    print()

    raise SystemExit(1)


# ============================================================
# Find continuous valid region containing Vcmd = 0
# ============================================================

left = idx_zero

while left > 0 and valid[left - 1]:
    left -= 1


right = idx_zero

while (
    right < len(vcmd) - 1
    and valid[right + 1]
):
    right += 1


# ============================================================
# Extract valid region
# ============================================================

region = slice(
    left,
    right + 1
)

vcmd_valid = vcmd[region]

voutp_valid = voutp[region]
voutn_valid = voutn[region]

vod_valid = vod[region]
vocm_valid = vocm[region]

tracking_valid = tracking_error[region]


# ============================================================
# Command limits
# ============================================================

vcmd_min = vcmd_valid[0]
vcmd_max = vcmd_valid[-1]


# ============================================================
# Single-ended output limits
#
# Both outputs are considered because they exchange roles
# depending on the polarity of the differential signal.
# ============================================================

vout_min = min(
    np.min(voutp_valid),
    np.min(voutn_valid)
)

vout_max = max(
    np.max(voutp_valid),
    np.max(voutn_valid)
)

vout_pp = (
    vout_max
    - vout_min
)


# ============================================================
# Differential output swing
# ============================================================

vod_min = np.min(
    vod_valid
)

vod_max = np.max(
    vod_valid
)

vod_pp = (
    vod_max
    - vod_min
)


# ============================================================
# Output common-mode range inside valid swing
# ============================================================

vocm_min = np.min(
    vocm_valid
)

vocm_max = np.max(
    vocm_valid
)


# ============================================================
# Maximum tracking error inside valid range
# ============================================================

tracking_max = np.max(
    np.abs(
        tracking_valid
    )
)


# ============================================================
# Determine which criterion is closest to its limit
# ============================================================

def criterion_margins(index):

    return {

        "XM6 saturation":
            sat_xm6[index],

        "XM7 saturation":
            sat_xm7[index],

        "XM8 saturation":
            sat_xm8[index],

        "XM10 saturation":
            sat_xm10[index],

        "Tracking error":
            TRACKING_TOL
            - abs(
                tracking_error[index]
            ),

        "Output common-mode":
            VOCM_TOL
            - abs(
                vocm_error[index]
            ),
    }


def limiting_criterion(index):

    margins = criterion_margins(
        index
    )

    return min(
        margins,
        key=margins.get
    )


lower_limit_criterion = (
    limiting_criterion(left)
)

upper_limit_criterion = (
    limiting_criterion(right)
)


# ============================================================
# Print results
# ============================================================

print()
print("==================================================")
print("Output Swing Analysis")
print("==================================================")
print()

print("Validity criteria:")
print()

print(
    "  Saturation:"
)

print(
    "    |VDS| - |VDSAT| >= 0"
)

print()

print(
    f"  Tracking:"
    f" |Vod - Vcmd| <= "
    f"{TRACKING_TOL*1e3:.1f} mV"
)

print()

print(
    f"  Output common-mode:"
    f" |Vocm - {VCM_TARGET:.2f}| <= "
    f"{VOCM_TOL*1e3:.1f} mV"
)

print()


print("--------------------------------------------------")
print("Valid differential command range")
print("--------------------------------------------------")

print(
    f"Vcmd minimum       : "
    f"{vcmd_min:.4f} V"
)

print(
    f"Vcmd maximum       : "
    f"{vcmd_max:.4f} V"
)

print(
    f"Command range      : "
    f"{vcmd_max-vcmd_min:.4f} Vpp"
)

print()


print("--------------------------------------------------")
print("Single-ended output swing")
print("--------------------------------------------------")

print(
    f"Vout minimum       : "
    f"{vout_min:.4f} V"
)

print(
    f"Vout maximum       : "
    f"{vout_max:.4f} V"
)

print(
    f"Vout swing         : "
    f"{vout_pp:.4f} Vpp"
)

print()


print("--------------------------------------------------")
print("Differential output swing")
print("--------------------------------------------------")

print(
    f"Vod minimum        : "
    f"{vod_min:.4f} V"
)

print(
    f"Vod maximum        : "
    f"{vod_max:.4f} V"
)

print(
    f"Vod swing          : "
    f"{vod_pp:.4f} Vpp"
)

print()


print("--------------------------------------------------")
print("Output common-mode")
print("--------------------------------------------------")

print(
    f"Vocm minimum       : "
    f"{vocm_min:.4f} V"
)

print(
    f"Vocm maximum       : "
    f"{vocm_max:.4f} V"
)

print()


print("--------------------------------------------------")
print("Tracking")
print("--------------------------------------------------")

print(
    f"Maximum error      : "
    f"{tracking_max*1e3:.3f} mV"
)

print()


print("--------------------------------------------------")
print("Boundary indicators")
print("--------------------------------------------------")

print(
    f"Lower-side limit   : "
    f"{lower_limit_criterion}"
)

print(
    f"Upper-side limit   : "
    f"{upper_limit_criterion}"
)

print()

print("==================================================")
print()


# ============================================================
# Plot 1:
# Single-ended outputs
# ============================================================

fig, ax = plt.subplots(
    figsize=(8, 5)
)

ax.plot(
    vcmd,
    voutp,
    label="Voutp"
)

ax.plot(
    vcmd,
    voutn,
    label="Voutn"
)

ax.axvline(
    vcmd_min,
    linestyle="--",
    label=(
        f"Lower limit = "
        f"{vcmd_min:.2f} V"
    )
)

ax.axvline(
    vcmd_max,
    linestyle="--",
    label=(
        f"Upper limit = "
        f"{vcmd_max:.2f} V"
    )
)

ax.set_xlabel(
    "Differential output command [V]"
)

ax.set_ylabel(
    "Output voltage [V]"
)

ax.set_title(
    "Output Voltage Swing"
)

ax.grid(True)

ax.legend()

fig.tight_layout()

fig.savefig(
    OUTPUT_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Plot 2:
# Saturation margins
# ============================================================

fig2, ax2 = plt.subplots(
    figsize=(8, 5)
)

ax2.plot(
    vcmd,
    sat_xm6,
    label="XM6"
)

ax2.plot(
    vcmd,
    sat_xm7,
    label="XM7"
)

ax2.plot(
    vcmd,
    sat_xm8,
    label="XM8"
)

ax2.plot(
    vcmd,
    sat_xm10,
    label="XM10"
)

ax2.axhline(
    0,
    linestyle="--",
    label="Saturation boundary"
)

ax2.axvline(
    vcmd_min,
    linestyle="--"
)

ax2.axvline(
    vcmd_max,
    linestyle="--"
)

ax2.set_xlabel(
    "Differential output command [V]"
)

ax2.set_ylabel(
    "|VDS| - |VDSAT| [V]"
)

ax2.set_title(
    "Output Device Saturation Margins"
)

ax2.grid(True)

ax2.legend()

fig2.tight_layout()

fig2.savefig(
    MARGIN_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Plot 3:
# Tracking error
# ============================================================

fig3, ax3 = plt.subplots(
    figsize=(8, 5)
)

ax3.plot(
    vcmd,
    tracking_error * 1e3,
    label="Tracking error"
)

ax3.axhline(
    TRACKING_TOL * 1e3,
    linestyle="--",
    label="+ tracking tolerance"
)

ax3.axhline(
    -TRACKING_TOL * 1e3,
    linestyle="--",
    label="- tracking tolerance"
)

ax3.axvline(
    vcmd_min,
    linestyle="--"
)

ax3.axvline(
    vcmd_max,
    linestyle="--"
)

ax3.set_xlabel(
    "Differential output command [V]"
)

ax3.set_ylabel(
    "Tracking error [mV]"
)

ax3.set_title(
    "Differential Output Tracking Error"
)

ax3.grid(True)

ax3.legend()

fig3.tight_layout()

fig3.savefig(
    ERROR_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Plot 4:
# Output common-mode error
# ============================================================

VOCM_PLOT = (
    SIM_DIR
    / "output_swing_common_mode.png"
)

fig4, ax4 = plt.subplots(
    figsize=(8, 5)
)

ax4.plot(
    vcmd,
    vocm,
    label="Vocm"
)

ax4.axhline(
    VCM_TARGET,
    linestyle="--",
    label=(
        f"Target = "
        f"{VCM_TARGET:.2f} V"
    )
)

ax4.axhline(
    VCM_TARGET + VOCM_TOL,
    linestyle="--",
    label=(
        f"+{VOCM_TOL*1e3:.0f} mV limit"
    )
)

ax4.axhline(
    VCM_TARGET - VOCM_TOL,
    linestyle="--",
    label=(
        f"-{VOCM_TOL*1e3:.0f} mV limit"
    )
)

ax4.axvline(
    vcmd_min,
    linestyle="--"
)

ax4.axvline(
    vcmd_max,
    linestyle="--"
)

ax4.set_xlabel(
    "Differential output command [V]"
)

ax4.set_ylabel(
    "Output common-mode voltage [V]"
)

ax4.set_title(
    "Output Common-Mode Regulation"
)

ax4.grid(True)

ax4.legend()

fig4.tight_layout()

fig4.savefig(
    VOCM_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Final information
# ============================================================

print("Plots saved to:")
print()

print(
    f"  {OUTPUT_PLOT}"
)

print(
    f"  {MARGIN_PLOT}"
)

print(
    f"  {ERROR_PLOT}"
)

print(
    f"  {VOCM_PLOT}"
)

print()


plt.show()
