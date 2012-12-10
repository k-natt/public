#!/usr/bin/env ruby

i = 0
puts IO.read('../names.txt').gsub(/"/,'').split(/,/).sort.map{|w|w.split(//).map{|a|a.ord-64}.reduce(:+)}.map{|a|a*(i+=1)}.reduce(:+)
# 871198282

