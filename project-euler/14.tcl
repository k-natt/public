#!/usr/bin/tclsh

# PE#14: even n->n/2; odd n->3n+1: longest chain starting < 1M

set limit 1e6

dict set nums 1 0
proc run n {
	upvar nums nums
	set x 0
	if {[dict exists $nums $n]} {return [dict get $nums $n]}
	if {$n % 2} {set x [expr 3*$n+1]} else {set x [expr $n/2]}
	set this [expr 1 + [run $x]]
	dict set nums $n $this;
	return $this
}

set maxx 0
set maxi 0
for {set i 2} {$i < $limit} {incr i} {
	set x [run $i]
	if {$x > $maxx} {set maxx $x; set maxi $i}
}

puts "$maxi: $maxx"
# 837799 : 524

