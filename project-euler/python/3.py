#!/usr/bin/env python

from lib import factors

i = 600851475143
f = 2

# 1.37 ms
while i % f == 0:
	i /= f

if i > 1:
	f = 3

while i > f:
	if i % f == 0:
		i /= f
	else:
		f += 1

print "Direct: %d" % f

# 1.37 ms
print "Iterator: %d" % max(factors(600851475143))

