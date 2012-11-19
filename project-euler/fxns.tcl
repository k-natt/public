
# Returns a list of numbers between start and end, inclusive, by increment.
proc mkrange {end {start 0} {increment 1}} {
	set lst [list]
	for {set i $start} {$i <= $end} {incr i $increment} {
		lappend lst $i
	}
	return $lst
}

# Map
proc map {var fxn lst} {
	set new [list]
	foreach $var $lst {
		lappend new [eval $fxn]
	}
	return $new
}

proc filter {var fxn lst} {
	set new {}
	foreach el $lst {
		set $var $el
		if $fxn {lappend new $el}
	}
	return $new
}

proc fold {vel vacc fxn lst {acc0 0}} {
	set $vacc $acc0
	foreach $vel $lst {
		set $vacc [eval $fxn]
	}
	return [expr $$vacc]
}

proc sum  lst { fold i all {expr $i + $all} $lst }
proc prod lst { fold i all {expr $i * $all} $lst 1 }

proc isPrime n {
	if {$n%2 == 0} {return [expr $n == 2]}
	set lim [expr $n**0.5]
	for {set f 3} "\$f <= $lim" {incr f 2} {
		if {$n % $f == 0} {return 0}
	}
	return 1
}

proc ndiv n {
	# 1, n
	set count 2 
	set f 2
	set lim [expr $n**0.5]
	while "\$f <= $lim" {if {$n%$f == 0} {incr count}; incr f}
	return $count
}

