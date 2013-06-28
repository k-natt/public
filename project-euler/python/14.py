#!/usr/bin/env python

colls = {0:0, 1:1}

def add(el, idx, lst):
	l = len(lst)
	if idx >= l:
		#d = max(l, idx - l + 1)
		d = idx - l + 1
		lst.extend([None for x in range(d)])
		lst[idx] = el
	lst[idx] = el

def collen(i):
	if i in colls:
		return colls[i]
	v = 1
	if i % 2 == 0:
		v += collen(i / 2)
	else:
		v += collen(3 * i + 1)
	colls[i] = v
	return v

if __name__ == "__main__":
	mc = 0
	mi = 0
	for i in range(1000000):
		c = collen(i)
		if c > mc:
			mc = c
			mi = i

	print "Number: {0}; length: {1}".format(mi, mc)

