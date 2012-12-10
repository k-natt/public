#!/usr/bin/env ruby

def prime(n)
	(2..n**0.5).each do |a|
		return false if n % a == 0
	end
	return true
end

c = 0
n = 2

until c > 10000
	c += 1 if prime(n)
	n += 1
end

puts n-1
# 104743

