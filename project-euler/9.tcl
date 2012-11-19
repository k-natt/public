#!/usr/bin/tclsh

# PE#9: a^2+b^2=c^2; a+b+c=1000

#a^2+b^2=(1000-a-b)^2=10e6-1000a-1000b-1000a+a^2+ab-1000b+ab+b^2
#10e6=2000a+2000b-2ab

#proc print {a b c} {upvar $a var; puts "$a: $var"}
#trace add variable c write print
#trace add variable c write print
#trace add variable c write print
for {set a 1} {$a <= 333} {incr a} {
	for {set b $a} {$b < 500} {incr b} {
		set c [expr 1000 - $a - $b]
		if {$a**2 + $b**2 == $c**2} {
			puts "$a^2 + $b^2 = $c^2; abc = [expr $a*$b*$c]"
			exit
		}
	}
}

# 200^2 + 375^2 = 425^2; abc = 31875000
# 31875000

