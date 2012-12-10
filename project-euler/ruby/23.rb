#!/usr/bin/env ruby

def sumdiv(n)
	#return 0 if n < 2
	return (1..n/2).reduce{|a,v| n%a == 0 ? a+v : a}
end


