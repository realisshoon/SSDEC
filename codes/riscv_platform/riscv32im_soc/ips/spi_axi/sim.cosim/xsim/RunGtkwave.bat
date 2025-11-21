@ECHO OFF

IF EXIST wave_bfm.vcd (
    gtkwave wave_bfm.vcd
) ELSE IF EXIST wave_bfm_fixed.vcd (
    gtkwave wave_bfm_fixed.vcd
) ELSE (
    ECHO "Cannot find wave_bfm.vcd or wave_bfm_fixed.vcd."
    PAUSE
)

