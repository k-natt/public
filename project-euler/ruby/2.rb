#!/usr/bin/env ruby

nums = [1, 1]


nums << nums[-1] + nums[-2] until nums[-1] > 4000000

puts nums.select{|a|a.even?}.reduce(:+)
# 4613732

