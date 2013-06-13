#!/usr/bin/env python

def factors(n):
	f = 2
	while n > f:
		if n % f == 0:
			n /= f
			yield f
		else:
			f += 1
	yield n

def exclude(n, gen):
	while True:
		nxt = gen.next()
		if(nxt % n != 0):
			yield nxt


def genall(): 
	n = 1
	while True:
		yield n
		n += 1

def genprimes():
	gen = genall()
	gen.next()
	while True:
		p = gen.next()
		yield p
		gen = exclude(p, gen)


def divany(n, lst):
	for i in lst:
		if n % i == 0:
			return True
	return False

