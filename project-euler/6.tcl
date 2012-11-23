#!/usr/bin/tclsh

# PE#6: sq(sum({1..100})) - sum(sq({1..100}))

set t [time {
	set sum 0
	set ssq 0

	for {set i 0} {$i <= 100} {incr i 1} {
		incr sum $i
		incr ssq [expr $i*$i]
	}

	set sqs [expr $sum*$sum]
	set diff [expr $sqs - $ssq]
} 1]

puts $diff
puts $t
# 25164150
# 370μs


source fxns.tcl 

set t [time {
	set nums [mkrange 100 1]
	set sqs  [map i {expr $i*$i} $nums]

	set diff [expr [sum $nums]**2 - [sum $sqs]]
} 1]

puts $diff
puts $t
# 25164150
# 853μs

