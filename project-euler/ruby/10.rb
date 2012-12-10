#!/usr/bin/env ruby

def prime(n)
	(2..n**0.5).each do |a|
		return false if n % a == 0
	end
	return true
end

sum = 2
n   = 3

# while is ~10% faster, but (...).step is perhaps more idiomatic.
#(3..2000000).step(2) do |n|
while n < 2000000
	sum += n if prime(n)
	n += 2
end

puts sum
# 142913828922

