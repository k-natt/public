#!/usr/bin/tclsh

# PE#2: sum of even fib. #s < 4e6

set t [time {
	set sum 0
	set a 1
	set b 1

	while {$a + $b < 4000000} {
		set c [expr $a + $b]
		if {$c % 2 == 0} {incr sum $c}
		set b $a
		set a $c
	}
} 7000]

puts $sum
puts $t
# 4613732
# 118μs/iter

