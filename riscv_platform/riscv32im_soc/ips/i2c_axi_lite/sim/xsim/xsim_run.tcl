# Vivado simulation run script for I2C AXI-Lite
# Generated on 2024-10-03

# Set test arguments
if {[info exists ::env(VCD)]} {
    set VCD $::env(VCD)
} else {
    set VCD 1
}

# Run simulation
if {$VCD == 1} {
    run -all
    quit
} else {
    run 100us
    quit
}
