#!/usr/bin/tclsh

# PE#7 - 10,001st prime

set lim 10001

#time {
#set c 0
#set n 2
#
#set predicate 0
#while {$c < $lim} {
#	while $predicate {incr n}
#	append predicate " || \$n % $n == 0"
#	incr c
#}
#}
#
#puts $n
## 104743

source fxns.tcl

set c 1
set n 3

while {$c < $lim} {
	if [isPrime $n] {incr c}
	incr n 2
}
incr n -2

puts $n
# 104743

