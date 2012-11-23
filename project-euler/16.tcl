#!/usr/bin/tclsh

# PE#16 sum of digits in 2^100

source fxns.tcl

puts [sum [split [expr 2**1000] ""]]
# 1366

