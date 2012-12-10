#!/usr/bin/env ruby

puts (1...1000).select{|a|a%3==0||a%5==0}.reduce(:+)
# 233168

