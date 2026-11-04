#!/usr/bin/env python3
import argparse
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt


def main():
    script_dir = Path(__file__).resolve().parent

    parser = argparse.ArgumentParser(
        description="Generate Monte Carlo histogram for the folded-cascode input-referred offset."
    )
    parser.add_argument(
        "-i", "--input",
        default=str(script_dir / "simulation" / "vos_mc.txt"),
        help="Input file with one Vos value per line in volts. Default: simulation/vos_mc.txt"
    )
    parser.add_argument(
        "-o", "--output",
        default=str(script_dir / "simulation" / "vos_mc_histogram.png"),
        help="Output PNG file. Default: simulation/vos_mc_histogram.png"
    )
    parser.add_argument("-b", "--bins", type=int, default=20, help="Histogram bins (default: 20)")
    parser.add_argument("--show", action="store_true", help="Show the plot interactively")
    args = parser.parse_args()

    input_path = Path(args.input)
    output_path = Path(args.output)

    x = np.loadtxt(input_path)
    if np.ndim(x) == 0:
        x = np.array([float(x)])

    n = len(x)
    mu = np.mean(x)
    sigma = np.std(x, ddof=1)

    x_mV = x * 1e3
    mu_mV = mu * 1e3
    sigma_mV = sigma * 1e3
    lo_3s = mu_mV - 3 * sigma_mV
    hi_3s = mu_mV + 3 * sigma_mV

    fig, ax = plt.subplots(figsize=(8, 5.4))

    ax.hist(x_mV, bins=args.bins, density=True, alpha=0.75)

    xx = np.linspace(min(x_mV.min(), lo_3s) - 1, max(x_mV.max(), hi_3s) + 1, 500)
    pdf = (1.0 / (sigma_mV * np.sqrt(2*np.pi))) * np.exp(-0.5 * ((xx - mu_mV)/sigma_mV)**2)
    ax.plot(xx, pdf, linewidth=2, label=fr"Gaussian fit ($\sigma$ = {sigma_mV:.2f} mV)")

    ax.axvline(mu_mV, linestyle="--", linewidth=1.5, label=fr"$\mu$ = {mu_mV:.2f} mV")
    ax.axvline(hi_3s, linestyle=":", linewidth=1.5, label=fr"$\mu+3\sigma$ = {hi_3s:.2f} mV")
    ax.axvline(lo_3s, linestyle=":", linewidth=1.5, label=fr"$\mu-3\sigma$ = {lo_3s:.2f} mV")

    ax.set_title("Monte Carlo Input Offset Distribution")
    ax.set_xlabel("Input-referred offset voltage [mV]")
    ax.set_ylabel("Probability density")
    ax.grid(True, alpha=0.35)
    ax.legend(loc="best")

    ax.text(
        0.02, 0.98,
        f"N = {n}\n"
        f"$\\mu$ = {mu_mV:.4f} mV\n"
        f"$\\sigma$ = {sigma_mV:.4f} mV\n"
        f"$3\\sigma$ = {3*sigma_mV:.4f} mV\n"
        f"Min = {x_mV.min():.4f} mV\n"
        f"Max = {x_mV.max():.4f} mV",
        transform=ax.transAxes,
        va="top", ha="left",
        bbox=dict(boxstyle="round", facecolor="white", alpha=0.85)
    )

    plt.tight_layout()
    output_path.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(output_path, dpi=300)

    print(f"Input   : {input_path}")
    print(f"Output  : {output_path}")
    print(f"N       = {n}")
    print(f"Mean    = {mu_mV:.4f} mV")
    print(f"Sigma   = {sigma_mV:.4f} mV")
    print(f"3 sigma = {3*sigma_mV:.4f} mV")
    print(f"Min     = {x_mV.min():.4f} mV")
    print(f"Max     = {x_mV.max():.4f} mV")

    if args.show:
        plt.show()


if __name__ == "__main__":
    main()
