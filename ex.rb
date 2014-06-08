# Function

def a(b = "c")
	puts b
end

class A
	def initialize(b = "c")
		@d = b
	end
	def e(f = "g")
		puts "#{@d}; #{f}"
	end
	attr_accessor :d
end

h = A.new()
i = A.new("j")

h.e
i.e()

if h.nil? 
	puts "aye"
elsif i.nil?
	puts "meh"
else
	puts "nay"
end

if __FILE__ == $0

