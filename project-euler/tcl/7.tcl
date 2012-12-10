#!/usr/bin/tclsh

# PE#7 - 10,001st prime

set lim 10001

set t [time {
	set c 0
	set n 2

	set predicate 0
	while {$c < $lim} {
		while $predicate {incr n}
		append predicate " || \$n % $n == 0"
		incr c
	}
} 1]

puts $n
puts $t
# 104743
# 93.1s

source fxns.tcl

set t [time {
	set c 1
	set n 3

	while {$c < $lim} {
		if [isPrime $n] {incr c}
		incr n 2
	}
	incr n -2
} 1]

puts $n
puts $t
# 104743
# 2978ms

