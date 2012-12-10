#!/usr/bin/env ruby

puts (1..100).reduce(:*).to_s.split(//).map{|i|i.to_i}.reduce(:+)
# 648

