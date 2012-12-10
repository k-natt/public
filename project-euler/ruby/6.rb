#!/usr/bin/env ruby

puts (1..100).reduce(:+)**2 - (1..100).reduce{|acc,el|acc+el**2}
# 25164150

