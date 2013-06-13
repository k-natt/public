#!/usr/bin/env python

from lib import factors
from collections import Counter as mset
from operator import mul

facts = mset()
for i in range(1, 21):
	facts += mset(factors(i)) - facts

print reduce(mul, facts.elements(), 1)

