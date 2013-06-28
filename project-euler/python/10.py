#!/usr/bin/env python

# Sum of primes below 2,000,000

from lib import divisible_by_any

# Unfortunately slow, but a generator-sieve overflows the recursion limit.
def sum_primes(limit):
	n = 3
	primes = [2]

	while n < limit:
		if not divisible_by_any(n, primes):
			primes.append(n)
		n += 2
	return sum(primes)

if __name__ == '__main__':
	limit = 2000000
	print "Answer: " + str(sum_primes(limit))

