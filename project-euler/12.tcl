#!/usr/bin/tclsh

# PE#12: triangle number with >500 divisors

source fxns.tcl

proc ndiv n {
	if {$n == 1} {return 1}
	set c 1
	for {set i 2} {$i*$i < $n} {incr i} {
		if {$n % $i == 0} {incr c}
	}
	return [expr 2*$c]
}

puts [time {
	set n 1
	set sum 1

	while {[ndiv $sum] < 500} {
		incr n
		incr sum $n
	}
}]

# 13,625,753 microseconds
puts "$n: $sum ([ndiv $sum])"
# 12375: 76576500 (576)

