#!/usr/bin/tclsh

# PE#6: sq(sum({1..100})) - sum(sq({1..100}))

source fxns.tcl 

set nums [mkrange 100 1]
set sqs  [map i {expr $i*$i} $nums]

puts [expr [sum $nums]**2 - [sum $sqs]]
# 25164150

