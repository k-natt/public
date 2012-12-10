#!/usr/bin/env ruby

$nums = [1, 1]
def foo(n)
	#return $nums[n] || $nums[n] = 1 + foo(n%2 == 0 ? n/2 : 3*n + 1)
	return $nums[n] if $nums[n]
	ans = 1 + foo(n.even? ? n/2 : 3*n+1)
	$nums[n] = ans if n < 1000000
	return ans
end

maxi = 0
maxn = 0

(1...1000000).each do |i|
	n = foo(i)
	if n > maxn
		maxn = n
		maxi = i
	end
end

puts "#{maxi}: #{maxn}"
# 837799: 525

