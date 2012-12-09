#!/usr/bin/tclsh

# PE#18 - maximum sum path

# The answer is, of course, easiest calculated using dynamic programming. The
# largest total weight of node N is its own weight plus the weight of the
# larger of the two nodes from which it can be reached.
#                                    75
#                                 170  139
#                              187  217  221
#                            205  252  308  231
#                         225  256  390  355  296
#                       244  257  413  465  358  330
#                    332  259  490  538  472  421  397
#                  431  397  494  566  544  488  491  489
#               472  472  520  622  649  584  571  561  522
#             513  520  592  655  696  681  621  587  655  551
#          566  591  636  720  721  739  772  673  752  706  565
#        636  602  669  748  798  812  789  850  791  820  723  622
#     727  707  721  786  815  826  903  893  908  870  847  752  670
#   790  793  725  854  904  879  970  933  981  924  939  934  792  701
#794  855  891  881  927  913 1040 1068 1054 1074  977  992  994  796  724
#                                            ^^^^

source fxns.tcl

set t [time {
	# Had to remove leading zeros, lest they be interpreted as octal.
	set tree {
		{75}
		{95 64}
		{17 47 82}
		{18 35 87 10}
		{20 4 82 47 65}
		{19 1 23 75 3 34}
		{88 2 77 73 7 63 67}
		{99 65 4 28 6 16 70 92}
		{41 41 26 56 83 40 80 70 33}
		{41 48 72 33 47 32 37 16 94 29}
		{53 71 44 65 25 43 91 52 97 51 14}
		{70 11 33 28 77 73 17 78 39 68 17 57}
		{91 71 52 38 17 14 91 43 58 50 27 29 48}
		{63 66 4 68 89 53 67 30 73 16 69 87 40 31}
		{4 62 98 27 23 9 70 98 73 93 38 53 60 4 23}
	}

	set treelen [llength $tree]
	for {set i 0} {$i < $treelen} {incr i} {
		set last [lindex $tree [expr $i-1]]
		set row [lindex $tree $i]
		set length [llength $row]
		for {set j 0} {$j < $length} {incr j} {
			set left [lindex $last [expr $j - 1]]
			if {![llength $left]} {set left 0}
			set right [lindex $last $j]
			if {![llength $right]} {set right 0}
			set foo [max $left $right]
			set this [lindex $row $j]
			lset tree $i $j [expr $this + $foo]
		}
	}
	set answer [max {*}[lindex $tree [expr [llength $tree]-1]]]
} 555]

puts $answer
puts $t
# 1074
# 1735μs

