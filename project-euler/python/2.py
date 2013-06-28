#!/usr/bin/env python

import itertools
from lib import fibonacci_generator

# Sum of the even fibonacci numbers below 4,000,000

# 9.564 us
def method_direct(limit):
	sum_ = 0
	a = 1
	b = 1
	while b < limit:
		if b % 2 == 0:
			sum_ += b
		a, b = b, a+b
	return sum_


# 19.446 us
def method_itertools(limit):
	fibs = itertools.takewhile(lambda x: x < limit, fibonacci_generator(1, 1))
	evens = [x for x in fibs if x % 2 == 0]
	return sum(evens)

if __name__ == '__main__':
	limit = 4000000
	print "Direct: "   + str(method_direct(limit))
	print "Iterator: " + str(method_itertools(limit))

