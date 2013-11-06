#!/usr/bin/env python

pandig = list("123456789")

def ispan(s):
	return sorted(s) == pandig

def getstr(x):
	s = ""
	n = 1
	while len(s) < 9:
		s += str(n*x)
		n += 1
	return s

def pandigs():
	nums = []
	for i in range(10000):
		str = getstr(i)
		if ispan(str):
			nums.append((i, int(str)))
	return nums

if __name__ == "__main__":
	nums = pandigs()
	print "{} pandigitals found".format(len(nums))
	nums.sort(key=lambda x:x[1])
	print "largest: {} -> {}".format(nums[-1][0], nums[-1][1])

