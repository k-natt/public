#!/usr/bin/env python

# 653 ms
mx = 0
for i in range(100, 1000):
	for j in range(100, 1000):
		if str(i * j) == str(i * j)[::-1] and i * j > mx:
			mx = i * j

print "Naive: %d" % mx

# 325 ms
mx = 0
for i in range(100, 1000):
	for j in range(i, 1000):
		if str(i * j) == str(i * j)[::-1] and i * j > mx:
			mx = i * j

print "slightly better: %d" % mx

# 166 ms
mx = 0
for i in range(100, 1000):
	for j in range(i, 1000):
		x = i * j
		s = str(x)
		if x > mx and s == s[::-1]:
			mx = x

print "better: %d" % mx

# 46 ms
mx = 0
for i in range(999,99,-1):
	for j in range(i,99,-1):
		x = i * j
		if x > mx:
			s = str(x)
			if s == s[::-1]:
				mx = x

print "betterer: %d" % mx

# 317 ms
mx = max([i * j for i in range(100,1000) for j in range(i, 1000) if str(i*j) == str(i*j)[::-1]])

print "comprehension: %d" % mx
