#!/usr/bin/tclsh

source fxns.tcl

set limit 9999

proc sumdivs n {
	if {$n == 1 || $n == 2} {return 1}
	set sum 1
	for {set i 2} {$i*$i < $n} {incr i} {
		if {$n % $i == 0} {
			incr sum $i
			incr sum [expr $n/$i]
		}
	}
	if {$i*$i == $n} {incr sum $i}
	return $sum
}

set sum 0
set t [time {
	set amic {}
	for {set i 0} {$i < $limit} {incr i} {
		set a [sumdivs $i]
		set b [sumdivs $a]
		if {$b == $i && $a != $b} {lappend amic $a}
	}
	set sum [sum $amic]
} 1]

puts $sum
puts $t
# 31626
# 469ms
