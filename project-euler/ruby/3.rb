#!/usr/bin/env ruby

f = 2
i = 600851475143

while f < i
	if i % f == 0
		i /= f
	else
		f += 1
	end
end

puts i
# 6857

