#!/usr/bin/env ruby

a = 0
#1000.times do
	a = (2**1000).to_s.split(//).reduce{|a,v|a.to_i+v.to_i}
	#a = (2**1000).to_s.split(//).map{|a|a.to_i}.reduce(:+)
#end

puts a
# 1366

