#!/usr/bin/env python

from lib import divisible_by_any

# 10,001st prime number

def nth_prime(N):
	primes = [2]
	N -= 1
	x = 3
	while N > 0:
		if not divisible_by_any(x, primes):
			primes.append(x)
			N -= 1
		x += 2
	return primes[-1]


if __name__ == '__main__':
	N = 10001
	print "Answer: " + str(nth_prime(N))

