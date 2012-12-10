#!/usr/bin/tclsh

# PE#5: smallest number evenly divisible by {1..20}
# This is actually easier to do logically
# 1: 1
# 2:   2
# 3:     3
# 4:   2   2
# 5:         5
# 6:   2 3
# 7:           7
# 8:   2   2     2
# 9:     3         3
# 10:  2     5
# 11:                11
# 12:  2 3 2
# 13:                   13
# 14:  2       7
# 15:    3   5
# 16:  2   2     2         2
# 17:                        17
# 18:  2 3         3
# 19:                           19
# 20:  2   2 5
#      2 3 2 5 7 2 3 11 13 2 17 19
# Answer is the product of the columns.

source fxns.tcl
puts [prod {2 3 2 5 7 2 3 11 13 2 17 19}]
# 232792560

