#!/usr/bin/env ruby

def pal(s)
	return s.reverse.eql?s
end

max = 0
mi = mj = 0
(100...1000).each do |i|
	(i...1000).each do |j|
		if i * j > max && pal((i*j).to_s)
			mi = i
			mj = j
			max = i*j
		end
	end
end

puts "#{mi}*#{mj} = #{max}"
# 906609

