#!/usr/bin/env python

# 21.5 us
print sum(range(101))**2 - sum(map(lambda x:x*x, range(101)))

