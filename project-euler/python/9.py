#!/usr/bin/env python

# Product of only pythagorean triplet with sum 1000

def triplet_with_sum(N):
	for i in range(N/3, N):
		for j in range(i/2, i):
			k = N - i - j
			if i*i + j*j == k*k:
				return (i, j, k)

if __name__ == '__main__':
	N = 1000
	a, b, c = triplet_with_sum(N)
	print "{0}^2 + {1}^2 = {2}^2; product = {3}".format(a, b, c, a*b*c)

