#!/usr/bin/env python

from lib import divany

n = 3
ps = [2]
lim = 2000000

while n < lim:
	if not divany(n, ps):
		ps.append(n)
	n += 2

print sum(ps)

