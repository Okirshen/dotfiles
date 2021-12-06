#!/bin/sh

killall -q glava
while pgrep -x glava >/dev/null; do sleep 1; done
glava --desktop &
