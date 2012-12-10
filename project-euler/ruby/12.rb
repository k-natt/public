#!/usr/bin/env ruby

def ndivs(n)
	return 1 if(n < 2) 
	p = 2
	c = 1
	while p**2 < n
		c += 2 if n % p == 0
		p += 1
	end
	c += 1 if p**2 == n
	return c
end

n = 1
t = n

until ndivs(n) > 500 
	t += 1
	n += t
end

puts n
# 76576500

