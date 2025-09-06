#!/bin/bash

######################################################################
# @author      : luna (luna@$HOSTNAME)
# @file        : monitor
# @created     : Saturday Sep 06, 2025 01:08:25 CEST
#
# @description : 
######################################################################


./convert.sh
sleep 1
./render.sh

watch ./convert.sh
