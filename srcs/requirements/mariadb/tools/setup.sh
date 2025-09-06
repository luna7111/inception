#!/bin/sh

######################################################################
# @author      : luna (luna@$HOSTNAME)
# @file        : startup
# @created     : Friday Sep 05, 2025 17:21:18 CEST
#
# @description : startup script for the mariadb image
######################################################################


mysqld &

sleep 5
