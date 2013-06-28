#!/usr/bin/env python

import itertools

# Sum of the multiples of 3 and 5 below 1,000

# 175 us
def method_direct(N):
	total = 0
	for i in range(N):
		if i % 3 == 0 or i % 5 == 0:
			total += i
	return total

# 162 us
def method_comprehension(N):
	return sum([i for i in range(N) if i % 3 == 0 or i % 5 == 0])

# 273 us
def method_filter(N):
	return sum(itertools.ifilter(lambda x: x % 3 == 0 or x % 5 == 0, range(1000)))

if __name__ == '__main__':
	N = 1000
	print "Direct: "        + str(method_direct(N))
	print "Comprehension: " + str(method_comprehension(N))
	print "Itertools: "     + str(method_filter(N))

