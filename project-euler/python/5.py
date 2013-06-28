#!/usr/bin/env python

from lib         import factors
from collections import Counter as mset
from operator    import mul

# "smallest positive number that is evenly divisible by all of the numbers from 1 to 20"

def smallest_divisible(min_, max_):
	facts = mset()
	for i in range(min_, max_+1):
		facts += mset(factors(i)) - facts

	return reduce(mul, facts.elements(), 1)

if __name__ == '__main__':
	print "Answer: " + str(smallest_divisible(1, 20))

