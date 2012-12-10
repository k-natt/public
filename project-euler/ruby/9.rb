#!/usr/bin/env ruby

def tripsum(n = 1000)
	(1..n/2).each do |i|
		(i..n-i).each do |j|
			k = n - i - j
			return [i, j, k] if i**2 + j**2 == k**2
		end
	end
end

i, j, k = tripsum
puts "#{i}^2 + #{j}^2 = #{k}^2"
puts "#{i}*#{j}*#{k} = #{i*j*k}"
#200^2 + 375^2 = 425^2
#200*375*425 = 31875000
# 31875000

