#!/usr/bin/env python3

from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# Paths
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent

SIM_DIR = SCRIPT_DIR / "simulation" / "top_regression"

INPUT_FILE = SIM_DIR / "icmr_gain.dat"
OUTPUT_PLOT = SIM_DIR / "icmr_gain.png"


# ============================================================
# User settings
# ============================================================

VCM_NOM = 2.5          # Nominal common-mode voltage [V]
GAIN_DROP_DB = 3.0     # ICMR criterion [dB]


# ============================================================
# Check input file
# ============================================================

if not INPUT_FILE.is_file():
    raise SystemExit(
        f"ERROR: input file not found:\n"
        f"  {INPUT_FILE}\n\n"
        f"Run the ICMR simulation first."
    )


# ============================================================
# Load simulation results
#
# Expected format:
#
# VCM[V]   Differential_Gain[dB]
#
# Example:
#
# 0.00  74.8032
# 0.01  75.5812
# ...
# ============================================================

data = np.loadtxt(INPUT_FILE)

if data.ndim != 2 or data.shape[1] < 2:
    raise SystemExit(
        f"ERROR: unexpected format in:\n"
        f"  {INPUT_FILE}\n"
        f"Expected at least two columns: VCM and gain."
    )

vcm = data[:, 0]
gain_db = data[:, 1]


# ============================================================
# Remove invalid values, if any
# ============================================================

valid_numeric = np.isfinite(vcm) & np.isfinite(gain_db)

vcm = vcm[valid_numeric]
gain_db = gain_db[valid_numeric]

if len(vcm) == 0:
    raise SystemExit("ERROR: no valid numeric ICMR data found.")


# ============================================================
# Find nominal point
# ============================================================

idx_nom = np.argmin(np.abs(vcm - VCM_NOM))

vcm_nom = vcm[idx_nom]
gain_nom = gain_db[idx_nom]

gain_limit = gain_nom - GAIN_DROP_DB


# ============================================================
# Determine valid ICMR points
#
# Criterion:
#
# Ad(VCM) >= Ad(VCM_nominal) - 3 dB
#
# Only the continuous valid region containing VCM_NOM is used.
# This prevents isolated valid points elsewhere from being
# incorrectly included in the ICMR.
# ============================================================

valid_gain = gain_db >= gain_limit

if not valid_gain[idx_nom]:
    raise SystemExit(
        "ERROR: nominal VCM point does not satisfy the ICMR criterion."
    )


# Search toward lower VCM

left = idx_nom

while left > 0 and valid_gain[left - 1]:
    left -= 1


# Search toward higher VCM

right = idx_nom

while right < len(vcm) - 1 and valid_gain[right + 1]:
    right += 1


vcm_min = vcm[left]
vcm_max = vcm[right]

icmr_range = vcm_max - vcm_min


# ============================================================
# Results
# ============================================================

print()
print("==========================================")
print("ICMR Analysis")
print("==========================================")
print(f"Input file       : {INPUT_FILE}")
print()
print(f"Nominal VCM      : {vcm_nom:.3f} V")
print(f"Nominal gain     : {gain_nom:.3f} dB")
print(f"Gain criterion   : -{GAIN_DROP_DB:.1f} dB")
print(f"Gain limit       : {gain_limit:.3f} dB")
print()
print(f"ICMR minimum     : {vcm_min:.3f} V")
print(f"ICMR maximum     : {vcm_max:.3f} V")
print(f"ICMR range       : {icmr_range:.3f} V")
print("==========================================")
print()


# ============================================================
# Plot
# ============================================================

fig, ax = plt.subplots(figsize=(8, 5))

ax.plot(
    vcm,
    gain_db,
    linewidth=1.5,
    label="Differential gain"
)

ax.axhline(
    gain_limit,
    linestyle="--",
    linewidth=1.2,
    label=f"-{GAIN_DROP_DB:.0f} dB limit ({gain_limit:.2f} dB)"
)

ax.axvline(
    vcm_min,
    linestyle="--",
    linewidth=1.2,
    label=f"ICMR min = {vcm_min:.2f} V"
)

ax.axvline(
    vcm_max,
    linestyle="--",
    linewidth=1.2,
    label=f"ICMR max = {vcm_max:.2f} V"
)

ax.plot(
    vcm_nom,
    gain_nom,
    marker="o",
    label=f"Nominal VCM = {vcm_nom:.2f} V"
)

ax.set_xlabel("Input common-mode voltage [V]")
ax.set_ylabel("Differential gain [dB]")
ax.set_title("Input Common-Mode Range")

ax.grid(True)
ax.legend()

fig.tight_layout()

fig.savefig(
    OUTPUT_PLOT,
    dpi=300,
    bbox_inches="tight"
)

print(f"Plot saved to:")
print(f"  {OUTPUT_PLOT}")
print()

plt.show()
