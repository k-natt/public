#!/usr/bin/env python

from itertools import permutations

def accept(n):
	return 	int(n[1]+n[2]+n[3])%2  == 0 and \
		int(n[2]+n[3]+n[4])%3  == 0 and \
		int(n[3]+n[4]+n[5])%5  == 0 and \
		int(n[4]+n[5]+n[6])%7  == 0 and \
		int(n[5]+n[6]+n[7])%11 == 0 and \
		int(n[6]+n[7]+n[8])%13 == 0 and \
		int(n[7]+n[8]+n[9])%17 == 0


if __name__ == "__main__":
	s = sum([int(''.join(x)) for x in permutations("0123456789") if accept(x)])
	print s

