#!/usr/bin/tclsh

# PE#10: sum of primes < 2e6

source fxns.tcl

set t [time {
	set n 3
	set sum 2
	set limit 2e6
	while "\$n < $limit" {
		if [isPrime $n] {incr sum $n}
		incr n 2
	}
} 1]

puts $sum
puts $t
# 142913828922

#set n 2
#set sum 0
#set limit 2e6
#set predicate 0
#while 1 {
#	while $predicate {incr n}
#
#	if {$n >= $limit} break
#
#	incr sum $n
#
#	append predicate " || \$n % $n == 0"
#}
#
#puts $sum

