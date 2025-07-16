#!/bin/bash

if grep -q virtualbox /sys/class/dmi/id/product_name 2>/dev/null; then
    LIBGL_ALWAYS_SOFTWARE=true GALLIUM_DRIVER=llvmpipe kitty
else
    kitty
fi