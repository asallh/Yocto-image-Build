#!/bin/bash

source sources/poky/oe-init-build-env

# Add layers
bitbake-layers add-layer ../sources/meta-raspberrypi
bitbake-layers add-layer ../sources/meta-openembedded/meta-oe
bitbake-layers add-layer ../sources/meta-openembedded/meta-python
bitbake-layers add-layer ../sources/meta-openembedded/meta-networking

# Set the machine environment variable
export MACHINE=raspberrypi4-64

# Run the bitbake command
bitbake rpi-test-image
