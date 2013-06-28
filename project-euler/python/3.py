#!/usr/bin/env python

from lib import factors

# Largest prime factor of 600851475143


# 1.37 ms
def method_direct(N):
	f = 2
	while N % f == 0:
		N /= f

	if N > 1:
		f = 3

	while N > f:
		if N % f == 0:
			N /= f
		else:
			f += 1
	return f

# 1.37 ms
def method_max(N):
	return max(factors(N))

if __name__ == '__main__':
	large_number = 600851475143
	print "Direct: " + str(method_direct(large_number))
	print "Iterator: " + str(method_max(large_number))

