#!/usr/bin/tclsh

# PE#12: triangle number with >500 divisors

source fxns.tcl

proc ndiv n {
	if {$n == 1} {return 1}
	set c 1
	for {set i 2} {$i*$i < $n} {incr i} {
		if {$n % $i == 0} {incr c}
	}
	incr c $c
	if {$n % $i == 0} {incr c}
	return $c
}

set t [time {
	set n 1
	set sum 1

	while {[ndiv $sum] < 500} {
		incr n
		incr sum $n
	}
}]

puts "$n: $sum ([ndiv $sum])"
puts $t
# 12375: 76576500 (576)
# 13.4s

