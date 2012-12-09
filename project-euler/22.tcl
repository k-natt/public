#!/usr/bin/tclsh

# PE#22: names

source fxns.tcl

set fd [open names.txt]
set raw [read $fd]
close $fd

set rough [regexp -all -inline {(?:")(.*?)(?:",?)} $raw]

set offset [expr [scan A %c] - 1]

foreach {_ diamond} $rough {
	lappend unsorted [split $diamond {}]
}

set names [lsort $unsorted]

set split [map x {map y {expr [scan $y %c]-[scan A %c]-1} [split $x {}]} $names]

set i 0
set sum 0
while "\$i < [llength $split]" {
	incr sum [expr ($i+1)*[sum [lindex $split $i]]]
	incr i
}

puts $sum

