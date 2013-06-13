#!/usr/bin/env python

import itertools

# 175 us
s0 = 0
for i in range(1000):
	if i % 3 == 0 or i % 5 == 0:
		s0 += i

# 162 us
s1 = sum([i for i in range(1000) if i % 3 == 0 or i % 5 == 0])

# 273 us
s2 = sum(itertools.ifilter(lambda x: x % 3 == 0 or x % 5 == 0, range(1000)))

print "Direct: %d" % s0
print "Comprehension: %d" % s1
print "Itertools: %d" % s2

