#!/bin/bash

echo "action" | sudo devmem2 0x0243d040 word 0x00000400 
echo "action" | sudo devmem2 0x0243d020 word 0x00000458 
echo "action" | sudo devmem2 0x0243d058 word 0x00000400 
echo "action" | sudo devmem2 0x0243d010 word 0x00000400 
echo "action" | sudo devmem2 0x0243d050 word 0x00000400 
echo "action" | sudo devmem2 0x0c302048 word 0x00000400 
echo "action" | sudo devmem2 0x0c302050 word 0x00000450 
echo "action" | sudo devmem2 0x0c302028 word 0x00000400 
echo "action" | sudo devmem2 0x0c302038 word 0x00000400

echo "action" | sudo busybox devmem 0x0c303000 32 0x0000C400
echo "action" | sudo busybox devmem 0x0c303008 32 0x0000C458
echo "action" | sudo busybox devmem 0x0c303010 32 0x0000C400
echo "action" | sudo busybox devmem 0x0c303018 32 0x0000C458
echo "action" | sudo modprobe can
echo "action" | sudo modprobe can_raw
echo "action" | sudo modprobe mttcan
sudo ip link set down can0
sudo ip link set down can1
echo "action" | sudo ip link set can0 type can bitrate 500000 \
    dbitrate 2000000 berr-reporting on fd on
echo "action" | sudo ip link set can1 type can bitrate 500000 \
    dbitrate 2000000 berr-reporting on fd on
echo "action" | sudo ip link set up can0
echo "action" | sudo ip link set up can1

echo "action" | sudo jetson_clocks

