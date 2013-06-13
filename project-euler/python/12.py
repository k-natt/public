#!/usr/bin/env python

from math import sqrt

def gentris():
	i, n = 1, 1
	while True:
		yield n
		i += 1
		n += i

def ndivs(n):
	if n < 2: return 1
	d = 2
	sqt = int(sqrt(n))
	if sqt * sqt == n:
		c = 3
	else:
		c = 2
	for i in range(2,sqt):
		if n % i == 0:
			c += 2
	return c

def genlen(gen):
	l = 0
	for i in gen:
		l += 1
	return l

if name == __main__:
	en = gentris()


