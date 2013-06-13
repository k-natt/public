#!/usr/bin/env python

#colls = [1, 0]

colls = {0:0, 1:1}

def add(el, idx, lst):
	l = len(lst)
	if idx >= l:
		#d = max(l, idx - l + 1)
		d = idx - l + 1
		lst.extend([None for x in range(d)])
		lst[idx] = el
	lst[idx] = el

#def collen(n):
#	if n == 1:
#		return 0
#	if n < len(colls) and colls[n]:
#		return colls[n]
#	nxt = 0
#	if n % 2 == 0:
#		nxt = n / 2
#	else:
#		nxt = 3*n + 1
#
#	v = 1 + collen(nxt)
#	add(v, n, colls)
#	return v

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
	#print max(map(collen, range(1000000)))
	mc = 0
	mi = 0
	for i in range(1000000):
		c = collen(i)
		if c > mc:
			mc = c
			mi = i

	print "%d: %d" % (mi, mc)
