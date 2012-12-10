#!/usr/bin/tclsh

# PE#20: sum of digits in 100!

source fxns.tcl

set t [time {
	set answer [sum [split [factorial 100] {}]]
} 2000]

puts $answer
puts $t
# 648
# 814μs

