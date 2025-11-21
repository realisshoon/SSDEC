SHELL=/bin/bash

export DIR_I2C_AXI_LITE = .
export DIR_RTL          = rtl/verilog
export DIR_BENCH        = bench/verilog
export DIR_SIM          = sim
export DIR_API          = api/c

# Default target
all: help

# Help target
help:
	@echo "I2C AXI-Lite Module Makefile"
	@echo "Available targets:"
	@echo "  sim     - Run simulation"
	@echo "  clean   - Clean generated files"
	@echo "  help    - Show this help"

# Simulation target
sim:
	@echo "Running I2C AXI-Lite simulation..."
	@cd $(DIR_SIM)/xsim && $(MAKE) all

# Clean target
clean:
	@echo "Cleaning I2C AXI-Lite files..."
	@cd $(DIR_SIM)/xsim && $(MAKE) clean
	@/bin/rm -f *.log *.jou

# Clean all target
cleanall: clean

.PHONY: all sim clean cleanall help
