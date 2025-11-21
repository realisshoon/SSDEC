#!/bin/bash
# Clean all simulation files across all test stages

echo "Cleaning all SPI AXI simulation files..."

# Clean unit test
if [ -d "sim/unit/xsim" ]; then
    echo "  Cleaning unit test..."
    cd sim/unit/xsim && make clean 2>/dev/null && cd - > /dev/null
fi

# Clean integration test
if [ -d "sim/xsim" ]; then
    echo "  Cleaning integration test..."
    cd sim/xsim && make clean 2>/dev/null && cd - > /dev/null
fi

# Clean cosimulation test
if [ -d "sim.cosim/xsim" ]; then
    echo "  Cleaning cosimulation test..."
    cd sim.cosim/xsim && make clean 2>/dev/null && cd - > /dev/null
fi

# Remove any remaining xsim.dir directories
find . -type d -name "xsim.dir" -exec rm -rf {} + 2>/dev/null

# Remove .Xil directories
find . -type d -name ".Xil" -exec rm -rf {} + 2>/dev/null

# Remove lock files
find . -name "lock_file*.txt" -delete 2>/dev/null

# Remove test executables
find . -name "test" -type f -delete 2>/dev/null

echo "Cleanup completed!"

