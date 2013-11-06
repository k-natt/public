#!/usr/bin/env python

def isprime(N):
	if N % 2 == 0:
		return False
	for i in range(3, int(N**.5), 2):
		if N % i == 0:
			return False
	return True

def accept(a):
	for d in range(1, (10000+a)/2):
		if not isprime(a):
			continue
		b = a + d
		if not isprime(b):
			continue
		c = b + d
		if not isprime(c):
			continue
		if not (sorted(str(a)) == sorted(str(b)) == sorted(str(c))):
			continue
		print "{0} {1} {2}".format(a, b, c)
		return True
	return False

if __name__ == "__main__":
	for i in range(1000, 10000):
		accept(i)


