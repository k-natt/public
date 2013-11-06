#!/usr/bin/env python

from itertools import permutations 
from math import sqrt

def isprime(n):
	if n % 2 == 0:
		return False
	for d in range(3, int(sqrt(n)), 2):
		if n % d == 0:
			return False
	return True

if __name__ == "__main__":
	maxpp = 0
	digits = "123456789"
	for nd in range(1, 10):
		for perm in permutations(digits[0:nd]):
			num = int(''.join(perm))
			if num > maxpp and isprime(num):
				maxpp = num

	print "max: {}".format(maxpp)

