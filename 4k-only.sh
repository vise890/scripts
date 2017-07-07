#!/bin/sh
echo "==> switch off others"
xrandr \
--output VIRTUAL1 --off  \
--output eDP1 --off \
--output HDMI1 --off \
--output HDMI2 --off \
--output DP2 --off

echo "==> setup monitor on DP1 (4k screen)"
xrandr \
--output DP1 --mode 3840x2160 \
--pos 0x0 --rotate normal

echo "==> set dpi"
xrandr \
  --dpi 157

echo "==> set GDK_DPI_SCALE"
export GDK_DPI_SCALE=0.5
