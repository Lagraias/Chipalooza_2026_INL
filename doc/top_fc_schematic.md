
# CACE Summary for top_fc

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Low-frequency differential gain | ngspice              | gain_dc              |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Unity-gain frequency | ngspice              | fu                   |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Phase margin from differential AC response | ngspice              | pm                   |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| ICMR lower bound     | ngspice              | icmr_min             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| ICMR upper bound     | ngspice              | icmr_max             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| ICMR span            | ngspice              | icmr_span            |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Gain at VCM 2.5 V    | ngspice              | gain_nom             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Differential gain at 1 Hz | ngspice              | ad_1hz               |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Common-mode to differential gain at 1 Hz | ngspice              | acm_1hz              |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 1hz          | ngspice              | cmrr_1hz             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 1k           | ngspice              | cmrr_1k              |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 10k          | ngspice              | cmrr_10k             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 100k         | ngspice              | cmrr_100k            |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 1meg         | ngspice              | cmrr_1meg            |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| CMRR at 10meg        | ngspice              | cmrr_10meg           |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Integrated differential output noise (1 Hz to 100 MHz) | ngspice              | onoise_total         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Integrated input-referred noise (1 Hz to 100 MHz) | ngspice              | inoise_total         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| DC positive output   | ngspice              | voutp_dc             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| DC negative output   | ngspice              | voutn_dc             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| DC differential output | ngspice              | vout_diff_dc         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| DC output common-mode | ngspice              | vout_cm_dc           |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Raw minimum differential output | ngspice              | vod_min_raw          |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Raw maximum differential output | ngspice              | vod_max_raw          |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Raw positive-side peak-to-peak swing | ngspice              | voutp_pp_raw         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Raw negative-side peak-to-peak swing | ngspice              | voutn_pp_raw         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Valid differential output minimum (tracking and saturation) | ngspice              | swing_min            |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Valid differential output maximum (tracking and saturation) | ngspice              | swing_max            |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Valid differential peak-to-peak swing | ngspice              | swing_pp             |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Max absolute tracking error in valid region | ngspice              | tracking_error_max   |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Minimum output common-mode in valid region | ngspice              | voutcm_min           |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| Maximum output common-mode in valid region | ngspice              | voutcm_max           |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 1hz | ngspice              | psrrp_diff_1hz       |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 1k | ngspice              | psrrp_diff_1k        |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 10k | ngspice              | psrrp_diff_10k       |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 100k | ngspice              | psrrp_diff_100k      |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 1meg | ngspice              | psrrp_diff_1meg      |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ differential at 10meg | ngspice              | psrrp_diff_10meg     |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 1hz | ngspice              | psrrp_cm_1hz         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 1k | ngspice              | psrrp_cm_1k          |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 10k | ngspice              | psrrp_cm_10k         |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 100k | ngspice              | psrrp_cm_100k        |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 1meg | ngspice              | psrrp_cm_1meg        |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR+ common-mode at 10meg | ngspice              | psrrp_cm_10meg       |               ​ |          ​ |          any |          ​ |            ​ |          ​ |   Skip 🟧    |
| PSRR- differential at 1hz | ngspice              | psrrn_diff_1hz       |               ​ |          ​ |          any | 127.051 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- differential at 1k | ngspice              | psrrn_diff_1k        |               ​ |          ​ |          any | 129.242 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- differential at 10k | ngspice              | psrrn_diff_10k       |               ​ |          ​ |          any | 145.988 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- differential at 100k | ngspice              | psrrn_diff_100k      |               ​ |          ​ |          any | 166.120 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- differential at 1meg | ngspice              | psrrn_diff_1meg      |               ​ |          ​ |          any | 187.620 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- differential at 10meg | ngspice              | psrrn_diff_10meg     |               ​ |          ​ |          any | 203.911 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 1hz | ngspice              | psrrn_cm_1hz         |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 1k | ngspice              | psrrn_cm_1k          |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 10k | ngspice              | psrrn_cm_10k         |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 100k | ngspice              | psrrn_cm_100k        |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 1meg | ngspice              | psrrn_cm_1meg        |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |
| PSRR- common-mode at 10meg | ngspice              | psrrn_cm_10meg       |               ​ |          ​ |          any |  -0.000 dB |            ​ |          ​ |   Pass ✅    |


## Plots
