#!/usr/bin/env python

import itertools

lim = 4000000

sum_ = 0
a = 1
b = 1
while b < lim:
	if b % 2 == 0:
		sum_ += b
	a, b = b, a+b

# 9.564 us
print "Direct: %d" % sum_

# 19.446 us
def fib_iter(a, b):
	yield a
	yield b
	while True:
		a, b = b, a+b
		yield b

fibs = itertools.takewhile(lambda x: x < lim, fib_iter(1, 1))

sum_ = sum([x for x in fibs if x % 2 == 0])

print "comprehension + takewhile: %d" % sum_

