#!/bin/bash

######################################################################
# @author      : luna (luna@$HOSTNAME)
# @file        : convert
# @created     : Saturday Sep 06, 2025 00:51:58 CEST
#
# @description : 
######################################################################

set -x

./convert.sh

for infile in md/*; do
	outfile="./html/$infile.html"
	outfile=$(realpath $outfile)
	firefox $outfile
done

