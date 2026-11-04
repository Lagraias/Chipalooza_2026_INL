#!/usr/bin/env python3

from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# Paths
# ============================================================

SCRIPT_DIR = Path(__file__).resolve().parent
SIM_DIR = SCRIPT_DIR / "simulation" / "top_regression"

INPUT_FILE = SIM_DIR / "noise_spectrum.dat"

INPUT_PLOT = SIM_DIR / "input_referred_noise.png"
OUTPUT_PLOT = SIM_DIR / "output_referred_noise.png"


# ============================================================
# Integrated noise values from ngspice
#
# Only report integrated values actually extracted from the top_fc log.
# ============================================================

# Read the integrated noise values from the new top_fc noise log.
# Never reuse numerical constants from the fc_cmfb characterization.
import re
noise_log = (SIM_DIR / "top_fc_noise_tb.log").read_text(errors="replace") if (SIM_DIR / "top_fc_noise_tb.log").is_file() else ""
def find_integrated(keys):
    for key in keys:
        m = re.search(r"(?im)^\s*" + re.escape(key) + r"\s*=\s*([-+\d.eE]+)", noise_log)
        if m:
            return float(m.group(1))
    return None
ONOISE_TOTAL = find_integrated(["onoise_total", "onoise_integrated", "onoise_rms"])
INOISE_TOTAL = find_integrated(["inoise_total", "inoise_integrated", "inoise_rms"])


# ============================================================
# Frequencies for spot-noise extraction
# ============================================================

SPOT_FREQS = np.array([
    1,
    10,
    100,
    1e3,
    10e3,
    100e3,
    1e6,
    10e6,
])


# ============================================================
# Check file
# ============================================================

if not INPUT_FILE.is_file():
    raise SystemExit(
        f"\nERROR: input file not found:\n"
        f"  {INPUT_FILE}\n\n"
        f"Run the noise simulation first.\n"
    )


# ============================================================
# Load ngspice wrdata file
#
# Expected format:
#
# frequency   onoise_spectrum   inoise_spectrum
# ============================================================

data = np.genfromtxt(
    INPUT_FILE,
    names=True,
    dtype=float
)


if data.size == 0:
    raise SystemExit(
        "\nERROR: no valid data found in noise_spectrum.dat\n"
    )


# ============================================================
# Extract columns
# ============================================================

frequency = data["frequency"]
onoise = data["onoise_spectrum"]
inoise = data["inoise_spectrum"]


# ============================================================
# Remove invalid values
# ============================================================

valid = (
    np.isfinite(frequency)
    & np.isfinite(onoise)
    & np.isfinite(inoise)
    & (frequency > 0)
    & (onoise > 0)
    & (inoise > 0)
)

frequency = frequency[valid]
onoise = onoise[valid]
inoise = inoise[valid]


if len(frequency) == 0:
    raise SystemExit(
        "\nERROR: no valid positive noise data found.\n"
    )


# ============================================================
# Sort by frequency
# ============================================================

order = np.argsort(frequency)

frequency = frequency[order]
onoise = onoise[order]
inoise = inoise[order]


# ============================================================
# Helper: interpolate spot noise on log-frequency axis
# ============================================================

def log_interp(freq_target, freq, values):

    log_f = np.log10(freq)
    log_v = np.log10(values)

    value_log = np.interp(
        np.log10(freq_target),
        log_f,
        log_v
    )

    return 10 ** value_log


# ============================================================
# Spot-noise values
# ============================================================

spot_onoise = []
spot_inoise = []

for f in SPOT_FREQS:

    spot_onoise.append(
        log_interp(
            f,
            frequency,
            onoise
        )
    )

    spot_inoise.append(
        log_interp(
            f,
            frequency,
            inoise
        )
    )


spot_onoise = np.array(spot_onoise)
spot_inoise = np.array(spot_inoise)


# ============================================================
# Estimate broadband input-noise floor
#
# Use median between 100 kHz and 1 MHz.
# This is only an approximate estimate.
# ============================================================

floor_region = (
    (frequency >= 100e3)
    & (frequency <= 1e6)
)

if np.any(floor_region):

    inoise_floor = np.median(
        inoise[floor_region]
    )

else:

    inoise_floor = np.median(
        inoise
    )


# ============================================================
# Approximate 1/f corner
#
# Define the corner as the frequency where:
#
# input noise ~= sqrt(2) * broadband floor
#
# because:
#
# flicker_noise^2 ~= thermal_noise^2
# ============================================================

corner_level = np.sqrt(2) * inoise_floor

difference = np.abs(
    inoise - corner_level
)

idx_corner = np.argmin(
    difference
)

f_corner = frequency[idx_corner]


# ============================================================
# Print results
# ============================================================

print()
print("==================================================")
print("Noise Analysis")
print("==================================================")
print()

print(f"Input file        : {INPUT_FILE}")
print()
print(
    f"Frequency range   : "
    f"{frequency[0]:.3g} Hz "
    f"to {frequency[-1]:.3g} Hz"
)

print()
print("--------------------------------------------------")
print("Input-referred spot noise")
print("--------------------------------------------------")
print()

for f, value in zip(
    SPOT_FREQS,
    spot_inoise
):

    if value >= 1e-6:

        print(
            f"{f:>10.3g} Hz : "
            f"{value*1e6:10.4f} uV/sqrt(Hz)"
        )

    else:

        print(
            f"{f:>10.3g} Hz : "
            f"{value*1e9:10.4f} nV/sqrt(Hz)"
        )


print()
print("--------------------------------------------------")
print("Output-referred spot noise")
print("--------------------------------------------------")
print()

for f, value in zip(
    SPOT_FREQS,
    spot_onoise
):

    if value >= 1e-3:

        print(
            f"{f:>10.3g} Hz : "
            f"{value*1e3:10.4f} mV/sqrt(Hz)"
        )

    elif value >= 1e-6:

        print(
            f"{f:>10.3g} Hz : "
            f"{value*1e6:10.4f} uV/sqrt(Hz)"
        )

    else:

        print(
            f"{f:>10.3g} Hz : "
            f"{value*1e9:10.4f} nV/sqrt(Hz)"
        )


print()
print("--------------------------------------------------")
print("Broadband input-noise estimate")
print("--------------------------------------------------")
print()

print(
    f"Noise floor       : "
    f"{inoise_floor*1e9:.3f} nV/sqrt(Hz)"
)

print(
    f"Approx. 1/f corner: "
    f"{f_corner:.3g} Hz"
)


print()
print("--------------------------------------------------")
print("Integrated noise: 1 Hz to 100 MHz")
print("--------------------------------------------------")
print()

print("Output noise RMS  : " + (f"{ONOISE_TOTAL*1e3:.3f} mV_rms" if ONOISE_TOTAL is not None else "not available in top_fc noise log"))

print("Input noise RMS   : " + (f"{INOISE_TOTAL*1e6:.3f} uV_rms" if INOISE_TOTAL is not None else "not available in top_fc noise log"))

print()
print("==================================================")
print()


# ============================================================
# Plot 1:
# Input-referred noise
# ============================================================

fig1, ax1 = plt.subplots(
    figsize=(8, 5)
)

ax1.loglog(
    frequency,
    inoise * 1e9,
    label="Input-referred noise"
)

ax1.axhline(
    inoise_floor * 1e9,
    linestyle="--",
    label=(
        f"Broadband floor ~ "
        f"{inoise_floor*1e9:.1f} nV/sqrt(Hz)"
    )
)

ax1.axvline(
    f_corner,
    linestyle="--",
    label=(
        f"Approx. 1/f corner ~ "
        f"{f_corner:.2g} Hz"
    )
)

ax1.set_xlabel(
    "Frequency [Hz]"
)

ax1.set_ylabel(
    "Input-referred noise [nV/sqrt(Hz)]"
)

ax1.set_title(
    "Input-Referred Noise Spectral Density"
)

ax1.grid(
    True,
    which="both"
)

ax1.legend()

fig1.tight_layout()

fig1.savefig(
    INPUT_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Plot 2:
# Output-referred noise
# ============================================================

fig2, ax2 = plt.subplots(
    figsize=(8, 5)
)

ax2.loglog(
    frequency,
    onoise,
    label="Output-referred noise"
)

ax2.set_xlabel(
    "Frequency [Hz]"
)

ax2.set_ylabel(
    "Output-referred noise [V/sqrt(Hz)]"
)

ax2.set_title(
    "Output-Referred Noise Spectral Density"
)

ax2.grid(
    True,
    which="both"
)

ax2.legend()

fig2.tight_layout()

fig2.savefig(
    OUTPUT_PLOT,
    dpi=300,
    bbox_inches="tight"
)


# ============================================================
# Final information
# ============================================================

print("Plots saved to:")
print()
print(f"  {INPUT_PLOT}")
print(f"  {OUTPUT_PLOT}")
print()

plt.show()
