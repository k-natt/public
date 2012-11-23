#!/usr/bin/tclsh

# PE#9: a^2+b^2=c^2; a+b+c=1000

# Wrapped in a function for ease of timing, 
# nested for makes breaking more clunky otherwise
proc run N {
	for {set a 1} {$a <= 333} {incr a} {
		for {set b $a} {$b < 500} {incr b} {
			set c [expr 1000 - $a - $b]
			if {$a**2 + $b**2 == $c**2} {
				return "$a $b $c [expr $a*$b*$c]"
			}
		}
	}
}

set x 0

set t [time {
	set x [run 1000]
} 4]

set a [lindex $x 0]
set b [lindex $x 1] 
set c [lindex $x 2]
set d [lindex $x 3]

puts "$a^2 + $b^2 = $c^2; abc = $d"
puts $t
# 200^2 + 375^2 = 425^2; abc = 31875000
# 253ms

