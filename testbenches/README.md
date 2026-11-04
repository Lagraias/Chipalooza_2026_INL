# GF180MCU-D Fully Differential Folded-Cascode OTA

This directory contains the schematic-level verification environment for a fully differential folded-cascode OTA with common-mode feedback (CMFB), implemented and simulated using the GF180MCU-D open PDK, Xschem, and ngspice.

The verification environment includes nominal operating-point, AC, transient, and input-offset simulations. Monte Carlo mismatch analysis is currently applied **only** to the input-referred offset characterization.

---

## 1. Project Scope

The project verifies a fully differential folded-cascode OTA together with its CMFB loop.

The main verification objectives are:

- validate the DC operating point of the folded-cascode core;
- validate the DC operating point of the CMFB circuit;
- validate the combined folded-cascode + CMFB operating point;
- evaluate differential AC performance;
- evaluate transient response;
- estimate the nominal input-referred offset;
- estimate the mismatch-induced input-referred offset through Monte Carlo simulation;
- automate the simulation flow from Xschem netlisting to ngspice execution and result post-processing.

The simulations are currently performed at schematic level using the GF180MCU-D ngspice models.

---

## 2. Tools and PDK

The flow uses:

- **Xschem** for schematic capture and SPICE netlist generation;
- **ngspice** for circuit simulation;
- **Python 3** for statistical post-processing and histogram generation;
- **Bash** for automated simulation and regression execution;
- **GF180MCU-D** as the target open PDK.

The ngspice model environment is loaded from the GF180MCU-D installation.

Typical model statements used in the testbenches are:

```spice
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
```

The `sm141064.ngspice` model file corresponds to the GF180MCU 3.3 V / 6 V device model set used by the circuit.

---

## 3. Directory Structure

The current testbench directory is organized as follows:

```text
testbenches/
├── cmfb_op_tb.sch
├── fc_cmfb_ac_tb.sch
├── fc_cmfb_offset_tb.sch
├── fc_cmfb_op_tb.sch
├── fc_cmfb_tran_tb.sch
├── folded_cascode_op_tb.sch
├── generate_offset_histogram.py
├── run_all_simulations.sh
├── README.md
└── simulation/
    ├── *.spice
    ├── *.log
    ├── *.raw
    ├── vos_mc.txt
    ├── vos_mc_histogram.png
    └── simulation_summary.txt
```

The `simulation/` directory is used for generated SPICE netlists, simulation logs, raw simulation files, Monte Carlo data, plots, and the regression summary.

---

## 4. Verification Matrix

| Testbench | Analysis | Statistical mode |
|---|---|---|
| `folded_cascode_op_tb.sch` | Operating point | Nominal |
| `cmfb_op_tb.sch` | Operating point | Nominal |
| `fc_cmfb_op_tb.sch` | Operating point | Nominal |
| `fc_cmfb_ac_tb.sch` | AC | Nominal |
| `fc_cmfb_tran_tb.sch` | Transient | Nominal |
| `fc_cmfb_offset_tb.sch` | DC offset sweep | Nominal + mismatch Monte Carlo |

Monte Carlo is currently used **only** for `fc_cmfb_offset_tb.sch`.

---

## 5. Testbenches

### 5.1 `folded_cascode_op_tb.sch`

Operating-point testbench for the folded-cascode core.

Main objectives:

- verify transistor biasing;
- inspect operating regions;
- verify internal node voltages;
- inspect branch currents;
- confirm that the folded-cascode core is correctly biased before closing the CMFB loop.

---

### 5.2 `cmfb_op_tb.sch`

Operating-point testbench for the common-mode feedback block.

Main objectives:

- verify the CMFB DC operating point;
- verify the CMFB output control voltage;
- verify the relationship between the output common-mode level and the CMFB reference level.

The CMFB output is used to control the folded-cascode bias node `Vb4`.

---

### 5.3 `fc_cmfb_op_tb.sch`

Operating-point verification of the complete folded-cascode OTA with CMFB connected.

Main objectives:

- verify the complete bias condition;
- verify the output common-mode voltage;
- verify the interaction between the OTA and the CMFB circuit;
- inspect the final bias voltages and currents before AC and transient simulation.

---

### 5.4 `fc_cmfb_ac_tb.sch`

Differential AC testbench for the folded-cascode OTA with CMFB active.

The AC transfer function is evaluated using the differential output:

```text
Vout_diff = Voutp - Voutn
```

Representative results obtained during the current design iteration were approximately:

- **DC differential gain:** 84.17 dB
- **Unity-gain frequency (UGF):** 4.85 MHz
- **Phase at UGF:** approximately -91.56°
- **Estimated differential phase margin:** approximately 88.44°

These values correspond to the specific bias conditions, device sizing, load, model revision, and testbench configuration used during the simulation.

They should be regenerated whenever the circuit, PDK models, bias voltages, or loading conditions are modified.

---

### 5.5 `fc_cmfb_tran_tb.sch`

Transient testbench for the complete folded-cascode OTA and CMFB system.

Main objectives:

- verify the differential transient response;
- observe output settling;
- observe CMFB settling;
- evaluate the response to small differential input perturbations;
- verify that the output common-mode remains controlled during transient operation.

The transient results depend strongly on the input stimulus amplitude, output load, bias conditions, and common-mode reference.

---

### 5.6 `fc_cmfb_offset_tb.sch`

Input-referred offset testbench.

The offset is extracted by sweeping the differential input voltage while keeping the input common-mode voltage constant.

The differential inputs are defined as:

```text
Vinp = VCM + Vdiff/2
Vinn = VCM - Vdiff/2
```

Therefore:

```text
Vinp - Vinn = Vdiff
```

The input-referred offset voltage is defined as the value of `Vdiff` for which:

```text
Voutp - Voutn = 0
```

or equivalently:

```math
V_{OS} = V_{diff}\big|_{V_{outp}=V_{outn}}
```

The differential output used in ngspice is:

```spice
let vod = v(voutp)-v(voutn)
```

A representative DC sweep is:

```spice
dc Vdiff -20m 20m 1u
```

and the offset is measured with:

```spice
meas dc vos WHEN vod=0 CROSS=1
```

The CMFB remains active during this sweep so that the output common-mode level stays controlled while the differential input is varied.

---

## 6. Representative Bias Conditions

The following values have been used in the current simulation setup:

```spice
.temp 27

.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 4.02
.param Vb3 = 2.3
.param Vb4 = 0.85
.param VCM = 2.5
```

The Xschem schematic should always be treated as the reference for the exact values used in a given simulation run.

---

## 7. Nominal Offset Simulation

With nominal device models and mismatch disabled, the folded-cascode OTA produced an offset close to zero.

A representative nominal result was:

```text
Vos ≈ 7.55e-11 V
```

This value is effectively zero and should be interpreted as simulator numerical residue rather than a physically meaningful offset.

The nominal simulation therefore indicates negligible systematic offset in the tested schematic configuration.

---

## 8. Monte Carlo Scope

Monte Carlo simulation is currently used **only for the input-referred offset characterization** performed with `fc_cmfb_offset_tb.sch`.

The operating-point, AC, and transient testbenches are currently executed using nominal device models and do not include Monte Carlo mismatch or global statistical process variation.

The offset verification therefore includes two distinct cases:

### 8.1 Nominal Offset

```spice
sw_stat_global = 0
sw_stat_mismatch = 0
```

This case is used to identify systematic offset in the nominal schematic.

### 8.2 Mismatch Monte Carlo Offset

```spice
sw_stat_global = 0
sw_stat_mismatch = 1
```

This case is used to estimate the statistical distribution of input-referred offset caused by local device mismatch.

The current Monte Carlo results should **not** be interpreted as statistical verification of gain, bandwidth, phase margin, transient response, power, or other OTA performance metrics.

---

## 9. GF180MCU-D Statistical Model Support

The GF180MCU-D ngspice model environment includes statistical modeling support through `design.ngspice`.

Relevant control parameters include:

```spice
sw_stat_global
sw_stat_mismatch
mc_skew
res_mc_skew
cap_mc_skew
```

For the current offset characterization, local mismatch is isolated using:

```spice
.param sw_stat_global=0
.param sw_stat_mismatch=1
```

A more complete process + mismatch analysis could later be performed using:

```spice
.param sw_stat_global=1
.param sw_stat_mismatch=1
```

but this is not part of the current reported offset result.

---

## 10. Monte Carlo Offset Methodology

For each mismatch Monte Carlo realization:

1. the statistical device realization is regenerated;
2. `Vdiff` is swept;
3. the differential output is calculated:

```spice
let vod = v(voutp)-v(voutn)
```

4. the input voltage corresponding to `vod = 0` is extracted;
5. the extracted `Vos` value is stored in `vos_mc.txt`.

A typical control sequence is conceptually:

```spice
.control

let run = 0
let nrun = 250

while run < nrun

    reset

    dc Vdiff -20m 20m 1u

    let vod = v(voutp)-v(voutn)

    meas dc vos WHEN vod=0 CROSS=1

    echo $&vos >> vos_mc.txt

    let run = run + 1

end

.endc
```

The actual Xschem testbench should be considered the reference implementation.

---

## 11. Monte Carlo Offset Results

A **250-run mismatch Monte Carlo analysis** was completed successfully.

All 250 runs produced a valid offset result:

```text
N = 250
```

The extracted statistical results were:

| Metric | Result |
|---|---:|
| Mean offset, μ | -1.0488 mV |
| Standard deviation, σ | 5.4113 mV |
| 3σ spread | 16.2340 mV |
| μ + 3σ | 15.1852 mV |
| μ - 3σ | -17.2828 mV |
| Minimum observed Vos | -16.8189 mV |
| Maximum observed Vos | 13.9315 mV |

The nominal offset was approximately zero, while the Monte Carlo simulations produced offsets in the mV range.

This indicates that, for the current schematic and statistical models, the input-referred offset is primarily dominated by device mismatch rather than by systematic schematic asymmetry.

A conservative magnitude estimate can be expressed as:

```math
|V_{OS}|_{3\sigma} \approx |\mu| + 3\sigma
```

which gives approximately:

```text
|Vos|_3sigma ≈ 17.3 mV
```

---

## 12. Offset Histogram

The Monte Carlo samples are stored in:

```text
simulation/vos_mc.txt
```

The histogram is generated with:

```text
generate_offset_histogram.py
```

The script calculates:

- number of valid samples;
- mean offset, `μ`;
- standard deviation, `σ`;
- `3σ`;
- `μ + 3σ`;
- `μ - 3σ`;
- minimum offset;
- maximum offset.

It also generates a histogram with a Gaussian fit and vertical markers for:

```text
μ
μ + 3σ
μ - 3σ
```

The generated plot is stored as:

```text
simulation/vos_mc_histogram.png
```

### Manual execution

From the `testbenches/` directory:

```bash
python3 generate_offset_histogram.py \
    -i simulation/vos_mc.txt \
    -o simulation/vos_mc_histogram.png \
    --show
```

---

## 13. Running the Automated Simulations

The complete verification flow can be executed using:

```bash
./run_all_simulations.sh
```

The script generates Xschem SPICE netlists, runs ngspice in batch mode, stores the corresponding logs, and generates a final summary in:

```text
simulation/simulation_summary.txt
```

### 13.1 Help

A complete list of commands, options, and available testbenches can be displayed with:

```bash
./run_all_simulations.sh --help
```

The help includes:

- usage syntax;
- available testbenches;
- individual testbench descriptions;
- Monte Carlo configuration;
- output location;
- examples.

### 13.2 Run All Simulations

```bash
./run_all_simulations.sh
```

This executes:

```text
folded_cascode_op_tb
cmfb_op_tb
fc_cmfb_op_tb
fc_cmfb_ac_tb
fc_cmfb_tran_tb
fc_cmfb_offset_tb
```

The operating-point, AC, and transient simulations are nominal.

Monte Carlo mismatch analysis is applied **only** to the input-offset testbench.

### 13.3 Run a Single Testbench

For example:

```bash
./run_all_simulations.sh fc_cmfb_ac_tb
```

or:

```bash
./run_all_simulations.sh fc_cmfb_tran_tb
```

Available testbench names are:

```text
folded_cascode_op_tb
cmfb_op_tb
fc_cmfb_op_tb
fc_cmfb_ac_tb
fc_cmfb_tran_tb
fc_cmfb_offset_tb
```

### 13.4 Configure the Offset Monte Carlo Runs

The default number of Monte Carlo mismatch realizations is:

```text
250
```

To change it:

```bash
./run_all_simulations.sh --mc-runs 500
```

The `--mc-runs` option affects **only** `fc_cmfb_offset_tb`.

It can also be used when running only the offset testbench:

```bash
./run_all_simulations.sh fc_cmfb_offset_tb --mc-runs 500
```

### 13.5 Command Summary

```text
./run_all_simulations.sh
    Run all testbenches.

./run_all_simulations.sh --mc-runs 500
    Run all testbenches and use 500 Monte Carlo mismatch runs
    for offset characterization only.

./run_all_simulations.sh fc_cmfb_ac_tb
    Run only the nominal AC testbench.

./run_all_simulations.sh fc_cmfb_offset_tb --mc-runs 250
    Run only the offset testbench with 250 mismatch Monte Carlo runs.

./run_all_simulations.sh --help
    Display command-line help.
```

---

## 14. Automated Simulation Flow

The regression flow is:

```text
                 +----------------------+
                 | Xschem testbench     |
                 +----------+-----------+
                            |
                            v
                 +----------------------+
                 | SPICE netlist        |
                 +----------+-----------+
                            |
                            v
                 +----------------------+
                 | ngspice batch run    |
                 +----------+-----------+
                            |
           +----------------+----------------+
           |                                 |
           v                                 v
 nominal OP / AC / transient          fc_cmfb_offset_tb
                                               |
                                               v
                                      mismatch Monte Carlo
                                               |
                                               v
                                         vos_mc.txt
                                               |
                                               v
                                      Python post-processing
                                               |
                                               v
                                      vos_mc_histogram.png

                            |
                            v
                 simulation_summary.txt
```

---

## 15. Generated Files

The `simulation/` directory may contain:

```text
simulation/
├── cmfb_op_tb.spice
├── cmfb_op_tb.log
├── fc_cmfb_ac_tb.spice
├── fc_cmfb_ac_tb.log
├── fc_cmfb_offset_tb.spice
├── fc_cmfb_offset_tb.log
├── fc_cmfb_op_tb.spice
├── fc_cmfb_op_tb.log
├── fc_cmfb_tran_tb.spice
├── fc_cmfb_tran_tb.log
├── folded_cascode_op_tb.spice
├── folded_cascode_op_tb.log
├── vos_mc.txt
├── vos_mc_histogram.png
└── simulation_summary.txt
```

Additional `.raw` and text files may be generated directly by individual ngspice testbenches.

---

## 16. Simulation Summary

After running the regression script, a summary is written to:

```text
simulation/simulation_summary.txt
```

A representative status report is:

```text
GF180 Fully Differential Folded-Cascode
Simulation Summary

Testbench                      Status
------------------------------ -------------------------
folded_cascode_op_tb           PASS
cmfb_op_tb                     PASS
fc_cmfb_op_tb                  PASS
fc_cmfb_ac_tb                  PASS
fc_cmfb_tran_tb                PASS
fc_cmfb_offset_tb              PASS
```

When the offset testbench is executed, the summary additionally reports:

```text
Requested runs : 250
Valid runs     : 250
Mean Vos       : -1.0488 mV
Sigma          : 5.4113 mV
3 sigma        : 16.2340 mV
mu + 3 sigma   : 15.1852 mV
mu - 3 sigma   : -17.2828 mV
Min Vos        : -16.8189 mV
Max Vos        : 13.9315 mV
```

Monte Carlo statistics are included only when `fc_cmfb_offset_tb` is part of the requested simulation set.

---

## 17. Recommended Metric Naming

To simplify future automatic parsing, testbenches should use consistent metric names.

Suggested names include:

```text
dc_gain_db
ugf_hz
phase_margin_deg
dc_power_w
vout_cm_v
slew_rate_pos
slew_rate_neg
settling_time_s
vos
```

For example:

```spice
print dc_gain_db
print ugf_hz
print phase_margin_deg
```

This will allow the Bash regression script to extract nominal AC, DC, and transient metrics automatically in future revisions.

---

## 18. Interpretation of Offset Results

The nominal result:

```text
Vos ≈ 0
```

indicates good schematic symmetry.

The mismatch Monte Carlo result:

```text
σ(Vos) ≈ 5.41 mV
```

shows that local device mismatch is the dominant source of input-referred offset under the tested conditions.

The current statistical estimate is:

```text
μ(Vos) ≈ -1.05 mV
3σ ≈ 16.23 mV
```

with an observed Monte Carlo range of approximately:

```text
-16.82 mV < Vos < 13.93 mV
```

The histogram obtained from the 250-run simulation is approximately Gaussian and is reasonably summarized by its mean and standard deviation for the current sample set.

---

## 19. Reproducibility Notes

Simulation results depend on:

- GF180MCU-D PDK revision;
- ngspice version;
- Xschem version;
- model files;
- device dimensions;
- testbench bias voltages;
- output loading;
- temperature;
- input common-mode voltage;
- Monte Carlo statistical configuration;
- Monte Carlo sample count;
- differential offset sweep range and resolution.

For reproducible reporting, these parameters should be recorded together with each final result set.

---

## 20. Current Limitations

The current environment is primarily a schematic-level verification flow.

The following limitations should be considered:

- nominal offset does not represent mismatch-induced offset;
- Monte Carlo is currently applied only to input-referred offset;
- AC, operating-point, and transient simulations are currently nominal;
- the reported 250-run Monte Carlo result includes mismatch only;
- global statistical process variation is not included in the reported offset distribution;
- Monte Carlo results depend on the number of statistical realizations;
- the results apply to the current GF180MCU-D statistical models and bias configuration;
- extracted-layout Monte Carlo offset has not yet been documented in this flow;
- post-layout parasitics may modify gain, bandwidth, settling, stability, and offset;
- convergence should be checked when increasing the Monte Carlo sample count or changing the offset sweep range.

---

## 21. Suggested Next Steps

Potential extensions of the verification flow include:

- increase offset Monte Carlo simulations from 250 to 500 or more runs;
- evaluate combined global process variation and mismatch for offset;
- perform PVT corner analysis;
- automate DC gain extraction;
- automate UGF and phase-margin extraction;
- automate DC power measurement;
- automate transient settling-time and slew-rate measurements;
- perform extracted-view simulations;
- compare schematic and post-layout performance;
- add specification-based pass/fail criteria;
- generate consolidated CSV or JSON reports;
- integrate the regression flow into CI/CD.

Monte Carlo analysis of metrics other than offset may be added later, but it is not part of the current verification scope.

---

## 22. Quick Start

From the `testbenches/` directory:

```bash
chmod +x run_all_simulations.sh
./run_all_simulations.sh
```

For 500 Monte Carlo mismatch runs in the offset testbench:

```bash
./run_all_simulations.sh --mc-runs 500
```

To run only the nominal AC testbench:

```bash
./run_all_simulations.sh fc_cmfb_ac_tb
```

To run only the offset testbench:

```bash
./run_all_simulations.sh fc_cmfb_offset_tb --mc-runs 250
```

To display the command-line help:

```bash
./run_all_simulations.sh --help
```

To regenerate only the offset histogram:

```bash
python3 generate_offset_histogram.py \
    -i simulation/vos_mc.txt \
    -o simulation/vos_mc_histogram.png \
    --show
```

The final regression report is stored at:

```text
simulation/simulation_summary.txt
```

and the offset histogram at:

```text
simulation/vos_mc_histogram.png
```
