#!/usr/bin/tclsh

# PE#15: ways through a 20x20 square grid

set size 20

set t [time {
	dict set nums 0 0 0

	for {set i 0} {$i <= $size} {incr i} {
		for {set j 0} {$j <= $size} {incr j} {
			if {$i == 0 || $j == 0} {
				dict set nums $i $j 1
				continue
			}
			set a [dict get $nums [expr $i-1] [expr $j]]
			set b [dict get $nums [expr $i] [expr $j-1]]
			dict set nums $i $j [expr $a + $b]
		}
	}
	set answer [dict get $nums [expr $size] [expr $size]]
} 150]

puts $answer
puts $t
# 137846528820
# 5853μs

