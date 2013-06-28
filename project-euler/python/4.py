#!/usr/bin/env python

# "Find the largest palindrome made from the product of two 3-digit numbers."

# 653 ms
def method_naive(min_,max_):
	mx = 0
	for i in range(min_, max_):
		for j in range(min_, max_+1):
			if str(i * j) == str(i * j)[::-1] and i * j > mx:
				mx = i * j
	return mx

# 325 ms
def method_unique(min_, max_):
	mx = 0
	for i in range(min_, max_+1):
		for j in range(i, max_+1):
			if str(i * j) == str(i * j)[::-1] and i * j > mx:
				mx = i * j
	return mx

# 166 ms
def method_str_once(min_, max_):
	mx = 0
	for i in range(min_, max_+1):
		for j in range(i, max_+1):
			x = i * j
			s = str(x)
			if x > mx and s == s[::-1]:
				mx = x
	return mx

# 46 ms
def method_top_down(min_, max_):
	mx = 0
	for i in range(max_, min_-1, -1):
		for j in range(i, min_-1, -1):
			x = i * j
			if x > mx:
				s = str(x)
				if s == s[::-1]:
					mx = x
	return mx

# 317 ms
def method_comprehension(min_, max_):
	return max([i * j for i in range(min_,max_+1) for j in range(i, max_+1) if str(i*j) == str(i*j)[::-1]])

if __name__ == '__main__':
	min_ = 100
	max_ = 999

	print "Naive: "         + str(method_naive(min_, max_))
	print "Uniques: "       + str(method_unique(min_, max_))
	print "str() once: "    + str(method_str_once(min_, max_))
	print "Top down: "      + str(method_top_down(min_, max_))
	print "Comprehension: " + str(method_comprehension(min_, max_))

