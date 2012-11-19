#!/usr/bin/tclsh

# PE#3: largest prime factor of 600851475143

set n 600851475143
set f 3

while {$n > $f} {
	if {$n % $f == 0} {
		set n [expr $n / $f]
	} else {
		incr f 2
	}
}

puts $f
# 6857

