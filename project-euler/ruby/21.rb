#!/usr/bin/env ruby

$arr = [0, 0]
def d(n) 
	$arr[n] = (1...n).reduce{|a,v| n%v==0 ? a+v : a} if !$arr[n]
	return $arr[n]
end

puts (0...10000).reduce{|a,v|x = d(v); x != v && v == d(x) ? a + v : a}
# 31626

