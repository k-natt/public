#!/usr/bin/tclsh

# PE#1 - sum of natural numbers < 1000 and divisible by 3 or 5.

set t [time {
	set sum 0

	for {set i 1} {$i < 1000} {incr i} {
		if {$i % 3 == 0 || $i % 5 == 0} {
			incr sum $i
		}
	}
} 1300]

puts $sum
puts $t
# 233168
# 773μs

# With fxns:

set t [time {
	source fxns.tcl

	set sum [sum [filter i {$i % 3 == 0 || $i % 5 == 0} [mkrange 999]]]
} 450]

puts $sum
puts $t
# 233168
# 1935μs
