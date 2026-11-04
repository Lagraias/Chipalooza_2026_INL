#!/usr/bin/env bash

set -u
set -o pipefail


# ============================================================
# GF180 Fully Differential Folded-Cascode Regression Runner
# ============================================================


# ============================================================
# PROJECT PATHS
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

SCHEMATIC_DIR="${PROJECT_DIR}/schematic"

SIM_DIR="${SCRIPT_DIR}/simulation"

SUMMARY_FILE="${SIM_DIR}/simulation_summary.txt"

CHARACTERIZATION_SCRIPT="${SCRIPT_DIR}/collect_results.py"

CHARACTERIZATION_LOG="${SIM_DIR}/characterization_summary.log"


# ============================================================
# TOOL / PDK PATHS
# ============================================================

XSCHEM_STD_LIB="/usr/local/share/xschem/xschem_library"

GF180_XSCHEM_LIB="/usr/local/share/OpenPDKs/gf180mcuD/libs.tech/xschem"

GF180_NGSPICE_LIB="/usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice"


# ============================================================
# DEFAULT SETTINGS
# ============================================================

MC_RUNS=250

OFFSET_STEP="10u"

RUN_ALL=0

FULL_REGRESSION=0

CLEAN_MODE=""

REQUESTED_TESTS=()


# ============================================================
# AVAILABLE TESTBENCHES
# ============================================================

ALL_TESTBENCHES=(

    "folded_cascode_op_tb"

    "cmfb_op_tb"

    "fc_cmfb_op_tb"

    "fc_cmfb_ac_tb"

    "fc_cmfb_tran_tb"

    "fc_cmfb_offset_tb"

    "fc_cmfb_stb_tb"

    "fc_cmfb_psrrp_tb"

    "fc_cmfb_psrrn_tb"

    "fc_cmfb_cmrr_tb"

    "fc_cmfb_icmr_tb"

    "fc_cmfb_output_swing_tb"

    "fc_cmfb_slew_rate_tb"

    "fc_cmfb_noise_tb"

    "fc_cmfb_power_tb"

    "fc_cmfb_settling_tb"

)


# ============================================================
# PYTHON POST-PROCESSING
# ============================================================

declare -A POSTPROCESSOR=(

    ["fc_cmfb_icmr_tb"]="extract_icmr.py"

    ["fc_cmfb_output_swing_tb"]="extract_output_swing.py"

    ["fc_cmfb_noise_tb"]="extract_noise.py"

    ["fc_cmfb_settling_tb"]="extract_settling.py"

)


# ============================================================
# HELP
# ============================================================

show_help() {

cat <<EOF

GF180 Fully Differential Folded-Cascode Regression Runner
=========================================================


USAGE

  ./run_all_simulations.sh

  ./run_all_simulations.sh --all

  ./run_all_simulations.sh <testbench>

  ./run_all_simulations.sh <testbench1> <testbench2> ...

  ./run_all_simulations.sh \
      fc_cmfb_offset_tb \
      --mc-runs <N>

  ./run_all_simulations.sh \
      --all \
      --mc-runs <N> \
      --offset-step <STEP>

  ./run_all_simulations.sh --clean

  ./run_all_simulations.sh --clean-all

  ./run_all_simulations.sh --help


DEFAULT BEHAVIOR

  Running:

      ./run_all_simulations.sh

  is equivalent to:

      ./run_all_simulations.sh --all

  The complete nominal characterization is executed.

  Monte Carlo mismatch is used only for:

      fc_cmfb_offset_tb


EXAMPLES

  Complete regression:

      ./run_all_simulations.sh


  Complete regression explicitly:

      ./run_all_simulations.sh --all


  Single testbench:

      ./run_all_simulations.sh fc_cmfb_ac_tb


  Several testbenches:

      ./run_all_simulations.sh \
          fc_cmfb_noise_tb \
          fc_cmfb_power_tb \
          fc_cmfb_settling_tb


  Offset Monte Carlo with 500 runs:

      ./run_all_simulations.sh \
          fc_cmfb_offset_tb \
          --mc-runs 500


  Offset Monte Carlo using a 5 uV sweep step:

      ./run_all_simulations.sh \
          fc_cmfb_offset_tb \
          --mc-runs 250 \
          --offset-step 5u


  Remove simulation results:

      ./run_all_simulations.sh --clean


  Completely empty simulation/:

      ./run_all_simulations.sh --clean-all


AVAILABLE TESTBENCHES

EOF


for tb in "${ALL_TESTBENCHES[@]}"; do

    echo "  ${tb}"

done


cat <<EOF


OPTIONS


  --all

      Run the complete regression.

      This is also the default when no testbench is
      explicitly selected.


  --mc-runs <N>

      Number of mismatch Monte Carlo runs for:

          fc_cmfb_offset_tb

      Default:

          ${MC_RUNS}


  --offset-step <STEP>

      Differential-input DC sweep resolution used during
      offset extraction.

      Default:

          ${OFFSET_STEP}

      Examples:

          10u
          5u
          1u


  --clean

      Remove generated result files from simulation/:

          *.raw
          *.dat
          *.png
          *.txt
          *.csv

      Preserve:

          *.spice
          *.log
          *_batch.sch


  --clean-all

      Delete every generated file directly inside:

          simulation/

      Source files are NOT modified:

          *.sch
          *.py
          README.md
          run_all_simulations.sh
          schematic/


  -h, --help

      Display this help message.


AUTOMATIC POST-PROCESSING


  fc_cmfb_icmr_tb

      -> extract_icmr.py


  fc_cmfb_output_swing_tb

      -> extract_output_swing.py


  fc_cmfb_noise_tb

      -> extract_noise.py


  fc_cmfb_settling_tb

      -> extract_settling.py


  Offset Monte Carlo uses:

      generate_offset_histogram.py


  Complete regression additionally uses:

      collect_results.py


CHARACTERIZATION OUTPUT


  A successful complete regression generates:

      simulation/simulation_summary.txt

      simulation/characterization_summary.txt

      simulation/characterization_summary.csv

      simulation/characterization_summary.log


  collect_results.py is executed automatically only when:

      1. The complete regression was requested.

      2. All testbenches passed.


BATCH NETLISTING


  Original Xschem schematics are never modified.

  Temporary copies are generated in:

      simulation/


  Project-local symbol references are converted to
  verified absolute paths.


  In addition:

      \$::180MCU_MODELS

  is replaced by:

      ${GF180_NGSPICE_LIB}


  This makes batch execution independent of Tcl variables
  available only in an interactive Xschem session.


NOTES


  - OP simulations are nominal.

  - AC simulations are nominal.

  - Transient simulations are nominal.

  - Stability simulations are nominal.

  - PSRR simulations are nominal.

  - CMRR simulation is nominal.

  - ICMR simulation is nominal.

  - Output swing simulation is nominal.

  - Slew-rate simulation is nominal.

  - Noise simulation is nominal.

  - DC power simulation is nominal.

  - Settling-time simulation is nominal.

  - Monte Carlo mismatch is currently used only for offset.

  - PVT/corner automation is intentionally not included yet.

EOF

}


# ============================================================
# CLEAN FUNCTIONS
# ============================================================

clean_results() {

    mkdir -p "${SIM_DIR}"


    echo "============================================================"
    echo " Cleaning simulation results"
    echo "============================================================"

    echo

    echo "Directory:"
    echo "  ${SIM_DIR}"

    echo


    find "${SIM_DIR}" \
        -maxdepth 1 \
        -type f \
        \( \
            -name '*.raw' \
            -o -name '*.dat' \
            -o -name '*.png' \
            -o -name '*.txt' \
            -o -name '*.csv' \
        \) \
        -print \
        -delete


    echo

    echo "Result files removed."

    echo

    echo "Preserved:"
    echo "  *.spice"
    echo "  *.log"
    echo "  *_batch.sch"

}


clean_all() {

    mkdir -p "${SIM_DIR}"


    echo "============================================================"
    echo " Cleaning ALL generated simulation files"
    echo "============================================================"

    echo

    echo "Directory:"
    echo "  ${SIM_DIR}"

    echo


    find "${SIM_DIR}" \
        -mindepth 1 \
        -maxdepth 1 \
        -type f \
        -print \
        -delete


    echo

    echo "simulation/ is now clean."

    echo

    echo "Source schematics and scripts were not modified."

}


# ============================================================
# ARGUMENT PARSING
# ============================================================

while [[ $# -gt 0 ]]; do

    case "$1" in


        --all)

            RUN_ALL=1

            shift

            ;;


        --mc-runs)

            [[ $# -ge 2 ]] || {

                echo "ERROR: --mc-runs requires a value."

                exit 1

            }


            MC_RUNS="$2"

            shift 2

            ;;


        --offset-step)

            [[ $# -ge 2 ]] || {

                echo "ERROR: --offset-step requires a value."

                exit 1

            }


            OFFSET_STEP="$2"

            shift 2

            ;;


        --clean)

            [[ -z "${CLEAN_MODE}" ]] || {

                echo "ERROR: choose only one clean mode."

                exit 1

            }


            CLEAN_MODE="clean"

            shift

            ;;


        --clean-all)

            [[ -z "${CLEAN_MODE}" ]] || {

                echo "ERROR: choose only one clean mode."

                exit 1

            }


            CLEAN_MODE="clean-all"

            shift

            ;;


        -h|--help)

            show_help

            exit 0

            ;;


        -*)

            echo "ERROR: unknown option '$1'"

            echo

            show_help

            exit 1

            ;;


        *)

            REQUESTED_TESTS+=("$1")

            shift

            ;;

    esac

done


# ============================================================
# CLEAN MODE
# ============================================================

if [[ -n "${CLEAN_MODE}" ]]; then


    if [[ \
        "${RUN_ALL}" -eq 1 \
        || "${#REQUESTED_TESTS[@]}" -gt 0 \
    ]]; then

        echo "ERROR:"
        echo "--clean/--clean-all cannot be combined with simulations."

        exit 1

    fi


    case "${CLEAN_MODE}" in

        clean)

            clean_results

            ;;


        clean-all)

            clean_all

            ;;

    esac


    exit 0

fi


# ============================================================
# BASIC VALIDATION
# ============================================================

if ! [[ "${MC_RUNS}" =~ ^[0-9]+$ ]]; then

    echo "ERROR: --mc-runs must be an integer."

    exit 1

fi


if [[ "${MC_RUNS}" -lt 2 ]]; then

    echo "ERROR: --mc-runs must be >= 2."

    exit 1

fi


if [[ \
    "${RUN_ALL}" -eq 1 \
    && "${#REQUESTED_TESTS[@]}" -gt 0 \
]]; then

    echo "ERROR:"
    echo "--all cannot be combined with explicit testbench names."

    exit 1

fi


if [[ ! -d "${SCHEMATIC_DIR}" ]]; then

    echo "ERROR: schematic directory not found:"
    echo "  ${SCHEMATIC_DIR}"

    exit 1

fi


for required_file in \
    "${SCHEMATIC_DIR}/folded_cascode.sym" \
    "${SCHEMATIC_DIR}/folded_cascode.sch" \
    "${SCHEMATIC_DIR}/cmfb.sym" \
    "${SCHEMATIC_DIR}/cmfb.sch"

do

    if [[ ! -f "${required_file}" ]]; then

        echo "ERROR: required file not found:"
        echo "  ${required_file}"

        exit 1

    fi

done


if [[ ! -d "${XSCHEM_STD_LIB}" ]]; then

    echo "ERROR: Xschem standard library not found:"
    echo "  ${XSCHEM_STD_LIB}"

    exit 1

fi


if [[ ! -d "${GF180_XSCHEM_LIB}" ]]; then

    echo "ERROR: GF180 Xschem library not found:"
    echo "  ${GF180_XSCHEM_LIB}"

    exit 1

fi


if [[ ! -d "${GF180_NGSPICE_LIB}" ]]; then

    echo "ERROR: GF180 ngspice library not found:"
    echo "  ${GF180_NGSPICE_LIB}"

    exit 1

fi


mkdir -p "${SIM_DIR}"


for cmd in \
    xschem \
    ngspice \
    python3 \
    sed \
    grep \
    find

do

    command -v "${cmd}" >/dev/null 2>&1 || {

        echo "ERROR: '${cmd}' not found in PATH."

        exit 1

    }

done


# ============================================================
# TESTBENCH SELECTION
# ============================================================

TESTBENCHES=()


if [[ \
    "${RUN_ALL}" -eq 1 \
    || "${#REQUESTED_TESTS[@]}" -eq 0 \
]]; then

    TESTBENCHES=("${ALL_TESTBENCHES[@]}")

    FULL_REGRESSION=1

else


    for requested in "${REQUESTED_TESTS[@]}"; do


        valid=0


        for tb in "${ALL_TESTBENCHES[@]}"; do


            if [[ "${tb}" == "${requested}" ]]; then

                valid=1

                break

            fi


        done


        if [[ "${valid}" -ne 1 ]]; then

            echo "ERROR: unknown testbench '${requested}'."

            echo

            show_help

            exit 1

        fi


        TESTBENCHES+=("${requested}")


    done


fi


# ============================================================
# CHECK SELECTED TESTBENCH FILES
# ============================================================

for tb in "${TESTBENCHES[@]}"; do


    if [[ ! -f "${SCRIPT_DIR}/${tb}.sch" ]]; then

        echo "ERROR: selected testbench schematic does not exist:"

        echo

        echo "  ${SCRIPT_DIR}/${tb}.sch"

        exit 1

    fi


done


# ============================================================
# OFFSET CHECK
# ============================================================

OFFSET_REQUESTED=0


for tb in "${TESTBENCHES[@]}"; do


    if [[ "${tb}" == "fc_cmfb_offset_tb" ]]; then

        OFFSET_REQUESTED=1

    fi


done


# ============================================================
# STATUS TABLES
# ============================================================

declare -A STATUS

declare -A POST_STATUS


# ============================================================
# XSCHEM NETLISTING
# ============================================================

netlist_xschem() {


    local tb="$1"

    local sch="${SCRIPT_DIR}/${tb}.sch"

    local spice="${SIM_DIR}/${tb}.spice"

    local temp_sch="${SIM_DIR}/${tb}_batch.sch"


    if [[ ! -f "${sch}" ]]; then

        echo "ERROR: schematic not found:"
        echo "  ${sch}"

        return 1

    fi


    rm -f \
        "${spice}" \
        "${temp_sch}"


    # ========================================================
    # Temporary schematic
    # ========================================================
    #
    # Original testbench is never modified.
    #
    # Fix:
    #
    #   folded_cascode.sym
    #   cmfb.sym
    #   $::180MCU_MODELS
    #
    # before batch netlisting.
    # ========================================================


    sed -E \
        -e "s|^C \{[^}]*folded_cascode\.sym\}|C {${SCHEMATIC_DIR}/folded_cascode.sym}|" \
        -e "s|^C \{[^}]*cmfb\.sym\}|C {${SCHEMATIC_DIR}/cmfb.sym}|" \
        -e "s|\\\$::180MCU_MODELS|${GF180_NGSPICE_LIB}|g" \
        "${sch}" \
        > "${temp_sch}"


    if [[ ! -s "${temp_sch}" ]]; then

        echo "ERROR: temporary batch schematic was not created:"

        echo "  ${temp_sch}"

        return 1

    fi


    if grep -q '\$::180MCU_MODELS' "${temp_sch}"; then

        echo "ERROR:"
        echo "Unresolved \$::180MCU_MODELS found in temporary schematic:"

        echo

        echo "  ${temp_sch}"

        return 1

    fi


    # --------------------------------------------------------
    # Xschem batch netlisting
    # --------------------------------------------------------

    (

        cd "${SCRIPT_DIR}"


        xschem \
            --tcl \
            "append XSCHEM_LIBRARY_PATH :${XSCHEM_STD_LIB}; append XSCHEM_LIBRARY_PATH :${GF180_XSCHEM_LIB}" \
            -n \
            -q \
            -x \
            -s \
            -o simulation \
            -N "${tb}.spice" \
            "${temp_sch}"


    ) >"${SIM_DIR}/${tb}_xschem.log" 2>&1


    if [[ ! -f "${spice}" ]]; then

        echo "ERROR: Xschem did not generate:"

        echo "  ${spice}"

        return 1

    fi


    if grep -q "IS MISSING" "${spice}"; then

        echo "ERROR: unresolved Xschem symbols found:"

        echo

        grep "IS MISSING" "${spice}"

        return 1

    fi


    if grep -Eq '^[[:space:]]*\?[[:space:]]*$' "${spice}"; then

        echo "ERROR: malformed '?' line found in generated netlist:"

        echo

        grep -n \
            '^[[:space:]]*\?[[:space:]]*$' \
            "${spice}"

        return 1

    fi


    return 0

}


# ============================================================
# OFFSET MONTE CARLO PATCH
# ============================================================

patch_offset_netlist() {


    local spice="$1"


    if grep -Eq \
        '^[[:space:]]*let[[:space:]]+nrun[[:space:]]*=' \
        "${spice}"

    then


        sed -Ei \
            "s/^([[:space:]]*let[[:space:]]+nrun[[:space:]]*=[[:space:]]*)[0-9]+/\1${MC_RUNS}/" \
            "${spice}"


    else


        echo "WARNING:"
        echo "No 'let nrun = ...' line found in:"
        echo "  ${spice}"


    fi


    if grep -Eq \
        '^[[:space:]]*dc[[:space:]]+Vdiff[[:space:]]+' \
        "${spice}"

    then


        sed -Ei \
            "s|^[[:space:]]*dc[[:space:]]+Vdiff[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+|    dc Vdiff -20m 20m ${OFFSET_STEP}|" \
            "${spice}"


    else


        echo "WARNING:"
        echo "No 'dc Vdiff ...' line found in:"
        echo "  ${spice}"


    fi

}


# ============================================================
# NGSPICE
# ============================================================

run_ngspice() {


    local tb="$1"


    (

        cd "${SIM_DIR}"


        ngspice \
            -b \
            "${tb}.spice"


    ) >"${SIM_DIR}/${tb}.log" 2>&1

}


# ============================================================
# FATAL ERROR CHECK
# ============================================================

log_has_fatal_error() {


    local log="$1"


    grep -Eqi \
        'fatal error|bad syntax|simulation\(s\) aborted|unknown subckt|timestep too small|incomplete or empty netlist|cannot open.*(model|include|file)' \
        "${log}"

}


# ============================================================
# OFFSET DATA HELPERS
# ============================================================

count_numeric_samples() {


    local file="$1"


    if [[ ! -f "${file}" ]]; then

        echo 0

        return

    fi


    grep -Ec \
        '^[[:space:]]*[-+]?(([0-9]+([.][0-9]*)?)|([.][0-9]+))([eE][-+]?[0-9]+)?[[:space:]]*$' \
        "${file}" \
        2>/dev/null \
        || true

}


make_numeric_copy() {


    local src="$1"

    local dst="$2"


    grep -E \
        '^[[:space:]]*[-+]?(([0-9]+([.][0-9]*)?)|([.][0-9]+))([eE][-+]?[0-9]+)?[[:space:]]*$' \
        "${src}" \
        > "${dst}" \
        || true

}


find_histogram_script() {


    local candidates=(

        "${SCRIPT_DIR}/generate_offset_histogram.py"

        "${SCRIPT_DIR}/generate_vos_histogram_jku_style.py"

        "${SCRIPT_DIR}/generate_vos_histogram.py"

    )


    local f


    for f in "${candidates[@]}"; do


        if [[ -f "${f}" ]]; then

            echo "${f}"

            return 0

        fi


    done


    return 1

}


# ============================================================
# PYTHON POST-PROCESSING
# ============================================================

run_postprocessor() {


    local tb="$1"


    local script="${POSTPROCESSOR[${tb}]:-}"


    if [[ -z "${script}" ]]; then

        POST_STATUS["${tb}"]="-"

        return 0

    fi


    local script_path="${SCRIPT_DIR}/${script}"

    local log_path="${SIM_DIR}/${tb}_postprocess.log"


    if [[ ! -f "${script_path}" ]]; then

        echo "WARNING: postprocessor not found:"

        echo

        echo "  ${script_path}"


        POST_STATUS["${tb}"]="MISSING"


        return 2

    fi


    echo

    echo "Post-processing with:"

    echo

    echo "  ${script}"


    (

        cd "${SCRIPT_DIR}"


        MPLBACKEND=Agg \
        python3 "${script_path}"


    ) >"${log_path}" 2>&1


    if [[ $? -ne 0 ]]; then


        echo "WARNING: post-processing failed."

        echo

        echo "Check:"

        echo

        echo "  ${log_path}"


        POST_STATUS["${tb}"]="FAIL"


        return 1

    fi


    POST_STATUS["${tb}"]="PASS"


    echo

    echo "Post-processing: PASS"


    return 0

}


# ============================================================
# HEADER
# ============================================================

echo "============================================================"

echo " GF180 Fully Differential Folded-Cascode Regression"

echo "============================================================"


echo

echo "Project directory:"
echo "  ${PROJECT_DIR}"


echo

echo "Testbench directory:"
echo "  ${SCRIPT_DIR}"


echo

echo "Schematic directory:"
echo "  ${SCHEMATIC_DIR}"


echo

echo "Simulation directory:"
echo "  ${SIM_DIR}"


echo

echo "Xschem standard library:"
echo "  ${XSCHEM_STD_LIB}"


echo

echo "GF180 Xschem library:"
echo "  ${GF180_XSCHEM_LIB}"


echo

echo "GF180 ngspice library:"
echo "  ${GF180_NGSPICE_LIB}"


echo


if [[ "${OFFSET_REQUESTED}" -eq 1 ]]; then


    echo "Offset Monte Carlo runs:"
    echo "  ${MC_RUNS}"


    echo

    echo "Offset sweep:"
    echo "  -20m to +20m"
    echo "  step = ${OFFSET_STEP}"


else


    echo "Offset Monte Carlo:"
    echo "  not requested"


fi


echo


# ============================================================
# MAIN REGRESSION
# ============================================================

for tb in "${TESTBENCHES[@]}"; do


    echo "------------------------------------------------------------"

    echo "Running ${tb}"

    echo "------------------------------------------------------------"


    POST_STATUS["${tb}"]="-"


    # --------------------------------------------------------
    # Xschem netlisting
    # --------------------------------------------------------

    if ! netlist_xschem "${tb}"; then


        echo

        echo "FAIL: Xschem netlisting failed."


        STATUS["${tb}"]="FAIL (netlist)"


        continue

    fi


    # --------------------------------------------------------
    # Offset special handling
    # --------------------------------------------------------

    if [[ "${tb}" == "fc_cmfb_offset_tb" ]]; then


        rm -f \
            "${SIM_DIR}/vos_mc.txt" \
            "${SIM_DIR}/vos_mc_numeric.txt" \
            "${SIM_DIR}/vos_mc_histogram.png" \
            "${SIM_DIR}/offset_histogram.log"


        patch_offset_netlist \
            "${SIM_DIR}/${tb}.spice"


        echo

        echo "Offset configuration:"


        grep -E \
            'let[[:space:]]+nrun|dc[[:space:]]+Vdiff' \
            "${SIM_DIR}/${tb}.spice" \
            || true


    fi


    # --------------------------------------------------------
    # ngspice
    # --------------------------------------------------------

    run_ngspice "${tb}"


    NGSPICE_RC=$?


    # --------------------------------------------------------
    # Log validation
    # --------------------------------------------------------

    if log_has_fatal_error "${SIM_DIR}/${tb}.log"; then


        echo

        echo "FAIL: fatal error found in ngspice log."


        echo

        echo "Check:"


        echo

        echo "  ${SIM_DIR}/${tb}.log"


        STATUS["${tb}"]="FAIL (log)"


        continue

    fi


    # --------------------------------------------------------
    # Non-zero return code without fatal log error
    # --------------------------------------------------------

    if [[ "${NGSPICE_RC}" -ne 0 ]]; then


        echo

        echo "WARNING:"


        echo

        echo "ngspice returned exit code ${NGSPICE_RC},"


        echo "but no fatal simulation error was found."


        echo

        echo "Continuing."


    fi


    # --------------------------------------------------------
    # Offset MC validation
    # --------------------------------------------------------

    if [[ "${tb}" == "fc_cmfb_offset_tb" ]]; then


        VOS_FILE="${SIM_DIR}/vos_mc.txt"


        VOS_NUMERIC="${SIM_DIR}/vos_mc_numeric.txt"


        valid_runs="$(count_numeric_samples "${VOS_FILE}")"


        if [[ "${valid_runs}" -eq 0 ]]; then


            echo

            echo "FAIL:"


            echo "No valid numeric Vos samples were generated."


            STATUS["${tb}"]="FAIL (no valid MC data)"


            continue

        fi


        make_numeric_copy \
            "${VOS_FILE}" \
            "${VOS_NUMERIC}"


        if [[ "${valid_runs}" -eq "${MC_RUNS}" ]]; then


            STATUS["${tb}"]="PASS"


        else


            STATUS["${tb}"]="PASS (${valid_runs}/${MC_RUNS} valid MC runs)"


        fi


        # ----------------------------------------------------
        # Offset histogram
        # ----------------------------------------------------

        if HIST_SCRIPT="$(find_histogram_script)"; then


            (

                cd "${SCRIPT_DIR}"


                MPLBACKEND=Agg \
                python3 "${HIST_SCRIPT}" \
                    -i "${VOS_NUMERIC}" \
                    -o "${SIM_DIR}/vos_mc_histogram.png"


            ) >"${SIM_DIR}/offset_histogram.log" 2>&1 \
            || {


                echo

                echo "WARNING:"


                echo "Offset histogram generation failed."


                echo

                echo "Check:"


                echo

                echo "  ${SIM_DIR}/offset_histogram.log"


            }


        else


            echo

            echo "WARNING:"


            echo "No offset histogram Python script found."


        fi


    else


        STATUS["${tb}"]="PASS"


    fi


    # --------------------------------------------------------
    # Python post-processing
    # --------------------------------------------------------

    if ! run_postprocessor "${tb}"; then


        case "${POST_STATUS[${tb}]:-}" in


            FAIL)


                STATUS["${tb}"]="FAIL (postprocess)"


                ;;


            MISSING)


                STATUS["${tb}"]="${STATUS[${tb}]} (postprocessor missing)"


                ;;


        esac


    fi


    echo

    echo "Result:"


    echo

    echo "  ${STATUS[${tb}]}"


    echo


done


# ============================================================
# SIMULATION SUMMARY
# ============================================================

{


echo "============================================================"

echo "GF180 Fully Differential Folded-Cascode"

echo "Simulation Summary"

echo "============================================================"


echo


printf "%-30s %-34s %s\n" \
    "Testbench" \
    "Simulation" \
    "Post-process"


printf "%-30s %-34s %s\n" \
    "------------------------------" \
    "----------------------------------" \
    "------------"


for tb in "${TESTBENCHES[@]}"; do


    printf "%-30s %-34s %s\n" \
        "${tb}" \
        "${STATUS[${tb}]:-NOT RUN}" \
        "${POST_STATUS[${tb}]:--}"


done


echo


# ============================================================
# OFFSET SUMMARY
# ============================================================

if [[ "${OFFSET_REQUESTED}" -eq 1 ]]; then


    VOS_FILE="${SIM_DIR}/vos_mc.txt"


    VOS_NUMERIC="${SIM_DIR}/vos_mc_numeric.txt"


    valid_runs="$(count_numeric_samples "${VOS_FILE}")"


    echo "Offset Monte Carlo"


    echo "------------------"


    echo "Sweep            : -20 mV to +20 mV"


    echo "Sweep step       : ${OFFSET_STEP}"


    if [[ "${valid_runs}" -gt 0 ]]; then


        if [[ ! -s "${VOS_NUMERIC}" ]]; then


            make_numeric_copy \
                "${VOS_FILE}" \
                "${VOS_NUMERIC}"


        fi


        python3 \
            - \
            "${VOS_NUMERIC}" \
            "${MC_RUNS}" <<'PY'

import sys

import numpy as np


path = sys.argv[1]

requested = int(sys.argv[2])


x = np.atleast_1d(
    np.loadtxt(path)
)


if x.size == 0:

    print(
        "No valid Monte Carlo offset data available."
    )

    sys.exit(0)


mu = np.mean(x)


sigma = (
    np.std(x, ddof=1)
    if x.size > 1
    else 0.0
)


print(
    f"Requested runs   : {requested}"
)

print(
    f"Valid runs       : {x.size}"
)

print(
    f"Mean Vos         : {mu*1e3:.4f} mV"
)

print(
    f"Sigma            : {sigma*1e3:.4f} mV"
)

print(
    f"3 sigma          : {3*sigma*1e3:.4f} mV"
)

print(
    f"mu + 3 sigma     : {(mu+3*sigma)*1e3:.4f} mV"
)

print(
    f"mu - 3 sigma     : {(mu-3*sigma)*1e3:.4f} mV"
)

print(
    f"Min Vos          : {np.min(x)*1e3:.4f} mV"
)

print(
    f"Max Vos          : {np.max(x)*1e3:.4f} mV"
)

PY


    else


        echo


        echo "No valid Monte Carlo offset data were generated."


        echo


        echo "Check:"


        echo


        echo "  ${SIM_DIR}/fc_cmfb_offset_tb.log"


    fi


    echo


fi


# ============================================================
# GENERATED FILES
# ============================================================

echo "Generated files"


echo "---------------"


echo "Netlists/logs/results:"


echo "  ${SIM_DIR}"


if [[ \
    "${OFFSET_REQUESTED}" -eq 1 \
    && -f "${SIM_DIR}/vos_mc_histogram.png" \
]]; then


    echo


    echo "Offset histogram:"


    echo "  ${SIM_DIR}/vos_mc_histogram.png"


fi


echo


echo "============================================================"


} | tee "${SUMMARY_FILE}"


# ============================================================
# DETERMINE REGRESSION STATUS
# ============================================================

FAILED=0


for tb in "${TESTBENCHES[@]}"; do


    if [[ "${STATUS[${tb}]:-}" == FAIL* ]]; then


        FAILED=1


    fi


done


# ============================================================
# COMPLETE CHARACTERIZATION SUMMARY
# ============================================================

if [[ "${FULL_REGRESSION}" -eq 1 ]]; then


    echo

    echo "============================================================"

    echo " Characterization Summary"

    echo "============================================================"

    echo


    if [[ "${FAILED}" -ne 0 ]]; then


        echo "Characterization summary was NOT generated."


        echo

        echo "Reason:"


        echo "  One or more testbenches failed."


        echo

        echo "Check:"


        echo "  ${SUMMARY_FILE}"


    elif [[ ! -f "${CHARACTERIZATION_SCRIPT}" ]]; then


        echo "WARNING:"


        echo "collect_results.py was not found:"


        echo

        echo "  ${CHARACTERIZATION_SCRIPT}"


    else


        echo "Generating characterization summary..."


        echo


        (

            cd "${SCRIPT_DIR}"


            python3 \
                "${CHARACTERIZATION_SCRIPT}"


        ) | tee "${CHARACTERIZATION_LOG}"


        COLLECT_RC=${PIPESTATUS[0]}


        if [[ "${COLLECT_RC}" -ne 0 ]]; then


            echo

            echo "ERROR:"


            echo "collect_results.py failed."


            echo

            echo "Check:"


            echo "  ${CHARACTERIZATION_LOG}"


            FAILED=1


        fi


    fi


fi


# ============================================================
# FINAL MESSAGE
# ============================================================

echo


echo "Simulation summary:"


echo

echo "  ${SUMMARY_FILE}"


if [[ \
    "${FULL_REGRESSION}" -eq 1 \
    && "${FAILED}" -eq 0 \
]]; then


    echo


    echo "Characterization summary:"


    echo

    echo "  ${SIM_DIR}/characterization_summary.txt"


    echo


    echo "Characterization CSV:"


    echo

    echo "  ${SIM_DIR}/characterization_summary.csv"


fi


echo


# ============================================================
# EXIT STATUS
# ============================================================

exit "${FAILED}"
