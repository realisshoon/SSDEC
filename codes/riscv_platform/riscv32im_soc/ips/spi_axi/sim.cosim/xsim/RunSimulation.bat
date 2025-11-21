@ECHO OFF

cmd.exe /c xelab -prj xsim.prj -debug typical top_bfm -s top_bfm

IF "%~1"=="" GOTO :CMD
IF /I "%1"=="GUI" GOTO :GUI

:CMD
    cmd.exe /c xsim top_bfm -t xsim_run.tcl
    GOTO :END

:GUI
    # select "Window-->Waveform"
    # run all
    xsim top_bfm -gui
    GOTO :END

:END
   PAUSE -1

