# XSIM wrapper Makefile for i2c_axi_lite

BENCH_DIR := $(abspath ../../bench)

.DEFAULT_GOAL := help

help:
	@echo "Available targets:"
	@echo "  run  - build and run batch simulation"
	@echo "  gui  - build and launch xsim GUI"
	@echo "  clean- remove simulation artefacts"

run:
	$(MAKE) -C $(BENCH_DIR) run

build:
	$(MAKE) -C $(BENCH_DIR) build

all: run

gui:
	$(MAKE) -C $(BENCH_DIR) gui

clean:
	$(MAKE) -C $(BENCH_DIR) clean

.PHONY: help run build all gui clean
