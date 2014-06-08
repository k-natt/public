#!/usr/bin/env python

def cfgen():
	x = 1
	frac = 2.0
	while True:
		ifrac = 1 / frac
		yield x + ifrac
		frac = 2 + ifrac

if __name__ == "__main__":
	cg = cfgen()


