#!/usr/bin/env ruby

size = 20

arr = []
arr << [1]*(size+1)

(1..size).each do |i|
	arr << [1]
	(1..size).each do |j|
		arr[i][j] = arr[i-1][j] + arr[i][j-1]
	end
end

puts arr.last.last
# 137846528820

