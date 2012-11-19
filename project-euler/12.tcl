#!/usr/bin/tclsh

# PE#12: triangle number with >500 divisors

set n 1
set sum 1

while {[ndiv $n] < 500} {incr n; incr sum $n}

puts "$n: $sum ([ndiv $sum])"

