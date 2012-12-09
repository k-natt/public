#!/usr/bin/tclsh

# PE#16 sum of digits in 2^100

source fxns.tcl

set t [time {
	set answer [sum [split [expr 2**1000] ""]]
} 1800]

puts $answer
puts $t
# 1366
# 252μs

