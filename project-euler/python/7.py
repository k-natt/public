#!/usr/bin/env python

from lib import divany

n = 10001
primes = [2]
n -= 1
x = 3
while n > 0:
	if not divany(x, primes):
		primes.append(x)
		n -= 1
	x += 2

print primes[-1]

