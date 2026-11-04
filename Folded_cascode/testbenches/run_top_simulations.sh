#!/usr/bin/env bash
# top_fc regression: use original Xschem schematics without modifying or copying them.
set -uo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
SCHEMATIC_DIR="${PROJECT_DIR}/schematic"
SIM_DIR="${SCRIPT_DIR}/simulation/top_regression"
XSCHEM_STD_LIB="${XSCHEM_STD_LIB:-/usr/local/share/xschem/xschem_library}"
GF180_XSCHEM_LIB="${GF180_XSCHEM_LIB:-/usr/local/share/OpenPDKs/gf180mcuD/libs.tech/xschem}"
GF180_NGSPICE_LIB="${GF180_NGSPICE_LIB:-/usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice}"
MC_RUNS=250
OFFSET_STEP=10u
ALL=0
REQUESTED=()
CLEAN=""

usage() {
  cat <<'HELP'
Usage: ./run_top_simulations.sh [--all | TESTBENCH ...] [OPTIONS]
       ./run_top_simulations.sh --list

Examples:
  ./run_top_simulations.sh --list
  ./run_top_simulations.sh top_fc_ac_tb
  ./run_top_simulations.sh top_fc_ac_tb top_fc_power_tb
  ./run_top_simulations.sh --all
  ./run_top_simulations.sh top_fc_offset_tb --mc-runs 500 --offset-step 5u

Options:
  --all                  Run every top_fc_*_tb.sch in testbenches/
  --mc-runs N            Monte Carlo offset runs (default 250)
  --offset-step STEP     DC offset sweep step (default 10u)
  --clean                Clear generated files in top_regression/
  --clean-all            Remove the entire top_regression/ directory
  --list                 List discovered testbenches
  -h, --help             Show this help

Source .sch/.sym files are never written or copied. Generated SPICE netlists
and results are kept exclusively in simulation/top_regression/.
HELP
}
list_tests() {
  local f
  shopt -s nullglob
  for f in "${SCRIPT_DIR}"/top_fc_*_tb.sch; do basename "${f}" .sch; done
  shopt -u nullglob
}
fail() { echo "ERROR: $*" >&2; exit 2; }
while (($#)); do
  case "$1" in
    --all) ALL=1; shift ;;
    --list) list_tests; exit 0 ;;
    --mc-runs) (($# >= 2)) || fail '--mc-runs needs a number'; MC_RUNS="$2"; shift 2 ;;
    --offset-step) (($# >= 2)) || fail '--offset-step needs a value'; OFFSET_STEP="$2"; shift 2 ;;
    --clean|--clean-all) CLEAN="$1"; shift ;;
    -h|--help) usage; exit 0 ;;
    -*) fail "unknown option $1" ;;
    *) REQUESTED+=("${1%.sch}"); shift ;;
  esac
done
if [[ -n "$CLEAN" ]]; then
  ((ALL == 0 && ${#REQUESTED[@]} == 0)) || fail 'clean cannot be combined with tests'
  case "$CLEAN" in
    --clean-all) rm -rf -- "$SIM_DIR" ;;
    --clean) if [[ -d "$SIM_DIR" ]]; then find "$SIM_DIR" -maxdepth 1 -type f -delete; fi ;;
  esac
  echo "Cleaned top results only: $SIM_DIR"
  exit 0
fi
[[ "$MC_RUNS" =~ ^[0-9]+$ ]] && ((MC_RUNS >= 2)) || fail '--mc-runs must be >= 2'
[[ "$OFFSET_STEP" =~ ^[0-9]+([.][0-9]+)?([munp]|meg)?$ ]] || fail 'invalid --offset-step'
((ALL == 0 || ${#REQUESTED[@]} == 0)) || fail 'cannot combine --all and named tests'
for cmd in xschem ngspice python3 grep sed; do command -v "$cmd" >/dev/null || fail "command not found: $cmd"; done
for dir in "$SCHEMATIC_DIR" "$GF180_XSCHEM_LIB" "$GF180_NGSPICE_LIB" "$XSCHEM_STD_LIB"; do [[ -d "$dir" ]] || fail "directory not found: $dir"; done

TESTS=()
if ((${#REQUESTED[@]})); then TESTS=("${REQUESTED[@]}"); else mapfile -t TESTS < <(list_tests); fi
((${#TESTS[@]})) || fail 'no top_fc testbenches found'
for tb in "${TESTS[@]}"; do
  [[ "$tb" == top_fc_*_tb && -f "${SCRIPT_DIR}/${tb}.sch" ]] || fail "testbench not found: $tb"
done
mkdir -p "$SIM_DIR"

# Paths in top_fc.sch may begin with "realhome/Documents/..." without a
# leading slash. Adding $HOME to the Xschem search path lets it resolve
# those names as $HOME/realhome/Documents/... . Include the schematic dir
# for simple names such as cmfb.sym and bias_circuit.sym.
# Define the GF180 model Tcl variable for the batch session too.
# No source schematic or symbol is modified.
TCL_SETUP="set ::180MCU_MODELS {${GF180_NGSPICE_LIB}}"
for lib in "$XSCHEM_STD_LIB" "$GF180_XSCHEM_LIB" "$SCHEMATIC_DIR" "$SCRIPT_DIR" "$HOME" "$PROJECT_DIR"; do
  TCL_SETUP+="; append XSCHEM_LIBRARY_PATH {:${lib}}"
done

patch_offset_netlist() {
  local spice="$1"
  if grep -Eqi '^[[:space:]]*let[[:space:]]+nrun[[:space:]]*=' "$spice"; then
    sed -Ei "s/^([[:space:]]*let[[:space:]]+nrun[[:space:]]*=[[:space:]]*)[0-9]+/\1${MC_RUNS}/I" "$spice"
  else echo 'WARNING: let nrun = not found in offset netlist'; fi
  if grep -Eqi '^[[:space:]]*dc[[:space:]]+vdiff[[:space:]]+' "$spice"; then
    sed -Ei "s|^([[:space:]]*)dc[[:space:]]+vdiff[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+|\1dc Vdiff -20m 20m ${OFFSET_STEP}|I" "$spice"
  else echo 'WARNING: dc Vdiff sweep not found in offset netlist'; fi
}
postprocess() {
  local tb="$1" script=""
  case "$tb" in
    top_fc_icmr_tb) script=top_extract_icmr.py ;;
    top_fc_noise_tb) script=top_extract_noise.py ;;
    top_fc_output_swing_tb) script=top_extract_output_swing.py ;;
    top_fc_setting_tb|top_fc_settling_tb) script=top_extract_settling.py ;;
  esac
  [[ -n "$script" ]] || return 0
  [[ -f "$SCRIPT_DIR/$script" ]] || { echo "Missing Python processor: $script" >&2; return 1; }
  if ! (cd "$SIM_DIR" && MPLBACKEND=Agg python3 "$SCRIPT_DIR/$script") >"$SIM_DIR/${tb}_postprocess.log" 2>&1; then
    echo "Post-processing failed: $SIM_DIR/${tb}_postprocess.log" >&2
    return 1
  fi
  echo "Post-processing PASS ($script)"
}
histogram() {
  local script="$SCRIPT_DIR/top_generate_offset_histogram.py"
  [[ -f "$script" && -s "$SIM_DIR/vos_mc.txt" ]] || { echo 'Missing offset samples or histogram script' >&2; return 1; }
  grep -E '^[[:space:]]*[-+]?(([0-9]+([.][0-9]*)?)|([.][0-9]+))([eE][-+]?[0-9]+)?[[:space:]]*$' \
    "$SIM_DIR/vos_mc.txt" >"$SIM_DIR/vos_mc_numeric.txt" || true
  [[ -s "$SIM_DIR/vos_mc_numeric.txt" ]] || return 1
  (cd "$SIM_DIR" && MPLBACKEND=Agg python3 "$script" -i "$SIM_DIR/vos_mc_numeric.txt" -o "$SIM_DIR/vos_mc_histogram.png") \
    >"$SIM_DIR/top_offset_histogram.log" 2>&1
}

STATUS=()
FAILURES=0
echo "GF180 top_fc regression: ${#TESTS[@]} testbench(es)"
echo "Original schematics (read-only): $SCHEMATIC_DIR"
echo "Results: $SIM_DIR"
for tb in "${TESTS[@]}"; do
  echo "===== $tb ====="
  netlist="$SIM_DIR/$tb.spice"
  xslog="$SIM_DIR/${tb}_xschem.log"
  simlog="$SIM_DIR/$tb.log"
  rm -f "$netlist" "$xslog" "$simlog"
  xrc=0
  (cd "$SCRIPT_DIR" && xschem --tcl "$TCL_SETUP" -n -q -x -s -o "$SIM_DIR" -N "$tb.spice" "$SCRIPT_DIR/$tb.sch") >"$xslog" 2>&1 || xrc=$?
  if ((xrc != 0)) || [[ ! -s "$netlist" ]]; then
    echo "Xschem netlisting failed (exit $xrc): $xslog" >&2
    tail -30 "$xslog" >&2
    STATUS+=("$tb,FAIL: xschem"); FAILURES=1; continue
  fi
  if grep -Eq 'IS MISSING|^[[:space:]]*\?[[:space:]]*$' "$netlist"; then
    echo "Unresolved Xschem references:" >&2
    grep -nE 'IS MISSING|^[[:space:]]*\?[[:space:]]*$' "$netlist" >&2
    echo "Inspect $xslog and check Xschem's library search path." >&2
    STATUS+=("$tb,FAIL: symbols"); FAILURES=1; continue
  fi
  # Replacements affect only the GENERATED SPICE netlist, never a .sch.
  if grep -Fq '$::180MCU_MODELS' "$netlist"; then
    GF180_MODEL_DIR="$GF180_NGSPICE_LIB" python3 - "$netlist" <<'PY'
import os, pathlib, sys
p = pathlib.Path(sys.argv[1])
p.write_text(p.read_text().replace('$::180MCU_MODELS', os.environ['GF180_MODEL_DIR']))
PY
  fi
  if [[ "$tb" == top_fc_offset_tb ]]; then
    rm -f "$SIM_DIR/vos_mc.txt" "$SIM_DIR/vos_mc_numeric.txt" "$SIM_DIR/vos_mc_histogram.png"
    patch_offset_netlist "$netlist"
  fi
  nrc=0
  (cd "$SIM_DIR" && ngspice -b "$tb.spice") >"$simlog" 2>&1 || nrc=$?
  if ((nrc != 0)) || grep -Eqi 'fatal error|bad syntax|simulation\(s\) aborted|unknown subckt|singular matrix|timestep too small|no such vector|not available or has zero length|Error:|cannot open.*(model|include|file)' "$simlog"; then
    echo "ngspice failed; inspect $simlog" >&2
    tail -15 "$simlog" >&2
    STATUS+=("$tb,FAIL: ngspice"); FAILURES=1; continue
  fi
  if [[ "$tb" == top_fc_offset_tb ]]; then
    if histogram; then STATUS+=("$tb,PASS"); else STATUS+=("$tb,FAIL: histogram"); FAILURES=1; fi
  elif postprocess "$tb"; then
    STATUS+=("$tb,PASS")
  else STATUS+=("$tb,FAIL: postprocess"); FAILURES=1
  fi
  echo "${STATUS[${#STATUS[@]}-1]}"
done
{
  echo 'GF180 top_fc simulation summary'
  echo 'Testbench,Status'
  printf '%s\n' "${STATUS[@]}"
} | tee "$SIM_DIR/top_simulation_summary.txt"

# For partial runs, summarize only existing results; missing metrics remain blank.
if [[ -f "$SCRIPT_DIR/top_collect_results.py" ]]; then
  if ! (cd "$SIM_DIR" && python3 "$SCRIPT_DIR/top_collect_results.py") >"$SIM_DIR/top_characterization_summary.log" 2>&1; then
    echo "WARNING: collector failed: $SIM_DIR/top_characterization_summary.log" >&2
    FAILURES=1
  else echo "Characterization: $SIM_DIR/characterization_summary.txt"; fi
fi
exit "$FAILURES"
