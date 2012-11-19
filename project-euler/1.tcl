#!/usr/bin/tclsh

# PE#1 - sum of natural numbers < 1000 and divisible by 3 or 5.

puts [time {
	set sum 0

	for {set i 1} {$i < 1000} {incr i} {
		if {$i % 3 == 0 || $i % 5 == 0} {
			incr sum $i
		}
	}
} 1000]
puts $sum
# 233168

# With fxns:

source fxns.tcl

puts [time {
set sum [sum [filter i {$i % 3 == 0 || $i % 5 == 0} [mkrange 999]]]
} 1000]

puts $sum
# 233168

