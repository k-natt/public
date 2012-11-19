#!/usr/bin/tclsh

# PE#2: sum of even fib. #s < 4e6

puts [time {
set sum 0
set a 1
set b 1

while {$a + $b < 4000000} {
	set c [expr $a + $b]
	if {$c % 2 == 0} {incr sum $c}
	set b $a
	set a $c
}
} 1000]

puts $sum
# 4613732

