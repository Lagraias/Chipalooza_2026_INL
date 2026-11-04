# Fully Differential Folded-Cascode OTA — CACE Characterization

Automated schematic-level characterization of a fully differential folded-cascode operational transconductance amplifier (OTA) with common-mode feedback (CMFB) and bias circuitry, implemented using the **GF180MCU** open PDK.

The characterization flow uses **Xschem**, **ngspice**, and **CACE 2.9.0** to run repeatable process–voltage–temperature (PVT) simulations. The original circuit schematics and symbols are **not modified**; CACE-specific testbench copies are kept under `cace/templates/`.

> **Scope:** This README describes the schematic-level CACE regression. The reported `Pass` states indicate that the configured measurements ran and produced acceptable values under the current YAML rules (many currently use `value: any`); they do **not** establish final design sign-off.

## 1. Project structure

```text
fully_diff_FC/
├── schematic/
│   ├── top_fc.sch
│   ├── top_fc.sym
│   ├── top_fc_stb.sch
│   ├── top_fc_stb.sym
│   ├── top_fc_power.sch
│   ├── top_fc_power.sym
│   └── xschemrc
├── testbenches/                # Original nominal testbenches
├── cace/
│   ├── top_fc.yaml            # Analyses using top_fc.sym
│   ├── top_fc_stb.yaml        # CMFB stability: top_fc_stb.sym
│   ├── top_fc_power.yaml      # Power: top_fc_power.sym
│   ├── templates/
│   │   ├── top_fc_ac_cace.sch
│   │   ├── top_fc_icmr_cace.sch
│   │   ├── top_fc_cmrr_cace.sch
│   │   ├── top_fc_noise_cace.sch
│   │   ├── top_fc_op_cace.sch
│   │   ├── top_fc_output_swing_cace.sch
│   │   ├── top_fc_psrrp_cace.sch
│   │   ├── top_fc_psrrn_cace.sch
│   │   ├── top_fc_settling_cace.sch
│   │   ├── top_fc_slew_rate_cace.sch
│   │   ├── top_fc_transient_cace.sch
│   │   ├── top_fc_stb_cace.sch
│   │   └── top_fc_power_cace.sch
│   └── scripts/
│       ├── extract_icmr.py
│       ├── extract_output_swing.py
│       └── extract_settling.py
├── netlist/                    # CACE-generated SPICE netlists
├── runs/                       # Per-run CACE reports and simulation data
├── doc/                        # Generated documentation
├── layout/
└── pex/
```

The `top_fc_stb.yaml` and `top_fc_power.yaml` files are maintained separately because they target **different DUT symbols and subcircuits**. Testbenches sharing `top_fc.sym` are grouped into one `top_fc.yaml`.

## 2. Requirements

- Linux environment with Xschem, ngspice, and **CACE 2.9.0** available on `PATH`.
- Installed **GF180MCU** PDK (`gf180mcuD`) including the ngspice and Xschem libraries.
- Python 3 for the three CACE postprocessors.
- A working `schematic/xschemrc` that resolves the project's hierarchical symbols.

Example environment used for this project:

```bash
export PDK_ROOT=/usr/local/share/OpenPDKs
export PDK=gf180mcuD
```

Check the installation and model library paths before running:

```bash
cace --version
ngspice --version
command -v xschem
ls "$PDK_ROOT/$PDK/libs.tech/ngspice/sm141064.ngspice"
```

Run all commands from the **project root**, `fully_diff_FC/`, so that the relative paths declared in the YAML files resolve correctly.

## 3. PVT characterization matrix

Each configured parameter is swept over the following conditions:

| Variable | Values |
|---|---|
| Process corner | `typical`, `ff`, `ss` |
| Temperature | `0`, `27`, `50`, `100` °C |
| Supply voltage (VDDA) | `4.5`, `5.0`, `5.5` V |
| Number of conditions | **3 × 4 × 3 = 36** |

The default input common-mode voltage is **2.5 V** and the default `balance_level` parameter is **1.5 V**, unless a specific testbench defines a different excitation. The `typical` entry displayed by CACE for a parameter may represent an **aggregate across PVT runs**; use the per-run `simulation_summary.md` for the actual nominal case (`typical`, 27 °C, 5.0 V).

## 4. Characterization catalog

### `cace/top_fc.yaml` — `top_fc.sym`

| Parameter key | Analysis | Primary results | Extraction | Validation |
|---|---|---|---|---|
| `ac_gain` | Differential AC response | DC gain, unity-gain frequency, phase metric | ngspice | Executed, Pass |
| `icmr` | Input common-mode range | Lower/upper bounds, span, gain at 2.5 V | `extract_icmr.py` | Executed, Pass* |
| `cmrr` | Common-mode rejection | Differential and CM-to-differential gain; CMRR at six frequencies | ngspice | Executed, Pass* |
| `noise` | Integrated noise, 1 Hz–100 MHz | Output- and input-referred RMS noise | ngspice | Executed, Pass |
| `operating_point` | DC operating point | `voutp_dc`, `voutn_dc`, differential and common-mode DC voltage | ngspice | Executed, Pass |
| `output_swing` | DC closed-loop output swing | Raw swing, valid swing, tracking error, common-mode limits | `extract_output_swing.py` | Executed, Pass* |
| `psrrp` | Positive-supply rejection | Differential and common-mode PSRR+ at six frequencies | ngspice | Executed, Pass* |
| `psrrn` | Negative-supply rejection | Differential and common-mode PSRR− at six frequencies | ngspice | Executed, Pass* |
| `settling` | Step settling | Rising/falling settling time, overshoot, static error | `extract_settling.py` | Updated; PVT rerun pending |
| `slew_rate` | Differential slew rate | Peak positive/negative SR, 10–90 %/90–10 % rates and times | ngspice | Simplified; PVT rerun pending |
| `transient` | Transient behavior | Input/output peak-to-peak, output RMS, common-mode bounds | ngspice | Simplified; PVT rerun pending |

Six frequencies for CMRR and PSRR: **1 Hz, 1 kHz, 10 kHz, 100 kHz, 1 MHz, 10 MHz**.

### Other DUT symbols

| YAML | DUT symbol | Parameter | Primary results | Validation |
|---|---|---|---|---|
| `cace/top_fc_stb.yaml` | `top_fc_stb.sym` | `cmfb_stability` | First loop-gain 0-dB crossing and phase metric | Executed, Pass* |
| `cace/top_fc_power.yaml` | `top_fc_power.sym` | `dc_power` | OTA, CMFB, bias and total currents/powers | Executed, Pass |

**Total configuration:** 13 parameters across 3 YAML files, corresponding to **468 PVT cases** if every parameter is executed once (11 + 1 + 1 parameters × 36). The 11-parameter `top_fc.yaml` alone defines **396 PVT cases**. Some cases include many internal AC/DC/transient sweep points and may be more computationally expensive than the case count suggests.

`Pass*` means that the measurement is available but an engineering interpretation or sign-off criterion remains to be reviewed (see [Known limitations](#8-known-limitations-and-follow-up-checks)).

## 5. Running CACE

**Run all 11 tests for `top_fc.sym`:**

```bash
cace cace/top_fc.yaml --source schematic --sequential --log-level INFO
```

**Run one parameter:**

```bash
cace cace/top_fc.yaml --source schematic --parameter ac_gain --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter icmr --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter cmrr --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter noise --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter operating_point --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter output_swing --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter psrrp --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter psrrn --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter settling --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter slew_rate --sequential --log-level DEBUG
cace cace/top_fc.yaml --source schematic --parameter transient --sequential --log-level DEBUG
```

**Run the two separate DUT configurations:**

```bash
cace cace/top_fc_stb.yaml --source schematic --parameter cmfb_stability --sequential --log-level INFO
cace cace/top_fc_power.yaml --source schematic --parameter dc_power --sequential --log-level INFO
```

To run all three YAML files consecutively without merging incompatible DUT netlists:

```bash
for yaml in cace/top_fc.yaml cace/top_fc_stb.yaml cace/top_fc_power.yaml; do
    echo "Running $yaml"
    cace "$yaml" --source schematic --sequential --log-level INFO || exit 1
done
```

## 6. Testbench processing strategy

**Use ngspice directly whenever practical.** The AC, CMRR, noise, operating-point, PSRR, slew-rate, and transient templates calculate their scalar metrics with native ngspice commands (`meas`, `let`, `print`, and/or `echo`). Their CACE output is a numeric ASCII `.data` file. Avoid column-name headers such as `set wr_vecnames` for numeric sweep data consumed directly by CACE.

Only three Python postprocessors are retained:

- **ICMR:** selects the contiguous VCM range containing 2.5 V satisfying the configured 3 dB gain-drop criterion.
- **Output swing:** selects the contiguous interval around zero command with ≤10 mV absolute tracking error and nonnegative saturation margins for the four specified MOS devices.
- **Settling:** evaluates whether the output stays within a 1 % settling band after each step, plus overshoot and steady-state error.

These thresholds are **characterization defaults, not formal design acceptance requirements**. The extraction scripts are invoked by CACE automatically; they should not be launched as separate standalone programs.

## 7. Results and reports

CACE creates a uniquely tagged directory for each invocation:

```text
runs/
└── RUN_YYYY-MM-DD_HH-MM-SS/
    └── parameters/
        └── <parameter>/
            ├── simulation_summary.md
            ├── run_0/
            ├── run_1/
            └── ...
```

Depending on the analysis, individual run directories contain generated SPICE netlists, ngspice logs, numerical `.data` results, and optional raw or waveform files. Use the parameter's `simulation_summary.md` to compare PVT cases and the per-run netlist/log to debug unexpected results.

Previously observed nominal schematic-level results (Typical, 27 °C, 5.0 V) include:

| Metric | Observed value | Notes |
|---|---:|---|
| Low-frequency differential gain | 71.098 dB | AC |
| Unity-gain frequency | 4.395 MHz | AC |
| Differential AC phase metric | 87.895° | Not a substitute for a formal loop-stability test |
| Input common-mode upper bound | 3.770 V | Gain-based ICMR; lower bound reported as 0 V |
| Output common-mode DC voltage | 2.505 V | OP; may vary significantly with corner/temperature |
| Output-referred integrated noise | 30.42 mV RMS | 1 Hz–100 MHz |
| Input-referred integrated noise | 163.3 µV RMS | 1 Hz–100 MHz |
| CMFB first crossover | 2.471 MHz | STB; phase interpretation under review |
| CMFB reported first-crossing phase margin | 104.893° | STB; sign/injection method should be verified |
| Total schematic power | Approximately 1.22 mW | Nominal-point estimate, 5.0 V |

These are simulation observations, not fabrication measurements or guaranteed specifications.

## 8. Known limitations and follow-up checks

1. **CMFB stability method:** The STB template estimates loop gain using `-V(CMFB_out)/V(Vb4)`. For **SS, 100 °C, 4.5 V**, the first crossing was ~1.681 MHz with a reported phase metric of **263°**. The loop-gain sign and voltage-injection interpretation require review before claiming unconditional stability. A `Pass` here does not imply loop-stability sign-off.
2. **PSRR− common-mode response:** It was approximately **0 dB** across the sampled frequencies. Confirm whether the testbench measures true negative-supply rejection or a movement of the ground/reference node.
3. **Very high CMRR / differential PSRR:** Schematic symmetry can produce extremely large numbers that may be influenced by numerical cancellation; layout parasitics and mismatch can reduce rejection substantially.
4. **Gain-based ICMR:** A 0 V lower bound under the gain-drop criterion does not establish transistor saturation or linear operation down to 0 V.
5. **Output swing:** The 10 mV tracking limit and saturation-margin rules are provisional; verify their suitability for the application.
6. **Noise:** The integrated-noise values depend on the full 1 Hz–100 MHz bandwidth; they are not low-frequency spectral-density figures.
7. **Transient updates:** Settling, slew rate and transient templates in the latest package still need execution in the target GF180MCU environment. Individual runs can fail if required step thresholds are not crossed.
8. **CACE spec limits:** Most YAML metrics currently have `typical: {value: any}`. Numeric min/max sign-off limits should be added only after specifications are defined.
9. **Missing layout files:** `No (compressed) GDS layout found` during documentation generation does not invalidate a successfully completed **schematic** simulation; physical and PEX sign-off remain separate tasks.

## 9. Adding a new testbench

1. Inspect the original nominal Xschem testbench and determine which DUT symbol/subcircuit it instantiates.
2. If the symbol matches an existing DUT, add the parameter to that DUT's YAML. Otherwise create a new YAML with the appropriate design `name`.
3. Copy/adapt the testbench as `cace/templates/<name>_cace.sch`, retaining the original `.sch` and `.sym` unchanged.
4. Use CACE condition placeholders for the process corner, temperature, and VDDA. Preserve the valid GF180MCU model corner names (`typical`, `ff`, `ss`).
5. Prefer native ngspice metrics. Add a Python postprocessor only for calculations that genuinely require waveform-wide logic.
6. Keep the ASCII export format and the YAML `variables` list in exactly the same order.
7. Test the new parameter alone across all 36 PVT conditions before running the complete YAML.
8. Inspect unusual results and define engineering acceptance limits before design sign-off.

## 10. Reproducibility

Record the CACE, ngspice, Xschem, and PDK versions alongside the simulation outputs. Use version control for `cace/`, the source schematics and the original testbenches; retain large generated `runs/`, `netlist/`, and temporary waveform outputs according to the project's repository policy.

This workflow is currently intended for **schematic-level PVT characterization**. Extending it to extracted views requires confirming the pin ordering, matching DUT interfaces, available extracted netlists, and the applicability of each measurement (especially CMFB loop injection) before claiming post-layout equivalence.
