#!/usr/bin/env python

from lib import divisible_by_any

ndiag = 1

class Primes:
	primes = [2, 3, 5, 7, 11, 13]
	def isPrime(self, N):
		if N > self.primes[-1]:
			self.extendPrimes(N)
		return N in self.primes

	def extendPrimes(self, N):
		x = self.primes[-1] + 2
		while self.primes[-1] < N:
			if not divisible_by_any(x, self.primes):
				self.primes.append(x)

if __name__ == "__main__":
	primes = Primes()
	nprime = 0
	ntotal = 1
	n = 1
	dn = 2
	while ntotal <= 1.0/.62*nprime:
		for x in range(4):
			n += dn
			if primes.isPrime(n):
				nprime += 1
		ntotal += 4
		dn += 2
	print "{0}: {1} / {2} = {3}".format(dn+1, nprime, ntotal, nprime*1.0/ntotal)

