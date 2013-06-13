#!/usr/bin/env python

from sys import exit

n = 1000

for i in range(n/3, n):
	for j in range(i/2, i):
		k = n - i - j
		if i*i + j*j == k*k:
			print "%d^2 + %d^2 = %d^2; prod = %d" % (i, j, k, i*j*k)
			exit(0)


