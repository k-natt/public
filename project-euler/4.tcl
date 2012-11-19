#!/usr/bin/tclsh

# PE#4: largest palindromic number (base 10) that is the product of 2 3-digit #s

set max 0
for {set i 999} {$i > 100} {incr i -1} {
	for {set j $i} {$j > 100} {incr j -1} {
		set prod [expr $i * $j]
		set rev [string reverse $prod];
		if {[string equal $prod $rev] && $prod > $max} {
			set max [expr $i * $j]
		}
	}
}
puts $max
#906609

