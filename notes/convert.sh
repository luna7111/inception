#!/bin/bash

######################################################################
# @author      : luna (luna@$HOSTNAME)
# @file        : convert
# @created     : Saturday Sep 06, 2025 00:51:58 CEST
#
# @description : 
######################################################################

set -x

for infile in md/*; do
	outfile="./html/$infile.html"
	outfile=$(realpath -m $outfile)
	mkdir -p $outfile
	rm -r $outfile
	pandoc "$infile" --self-contained --css=simple.css -o "$outfile"
done

