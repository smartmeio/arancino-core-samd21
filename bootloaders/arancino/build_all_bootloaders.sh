#!/bin/bash -ex

BOARD_ID=arancino NAME=samd21_sam_ba_arancino make clean all

BOARD_ID=arancino_mignon NAME=samd21_sam_ba_arancino_mignon make clean all

BOARD_ID=arancino_mignon NAME=samd21_sam_ba_arancino_mignon_RS485 RS485=RS485_ENABLED make clean all

echo Done building bootloaders!
