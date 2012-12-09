
proc pval args {
	foreach var $args {
		upvar $var val
		puts "$var: $val"
	}
}

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
	set accum $acc0
	foreach x $lst {
		set $vel $x
		set $vacc $accum
		set accum [expr $fxn]
	}
	return $accum
}

proc sum  lst { fold i all {$i + $all} $lst }
proc prod lst { fold i all {$i * $all} $lst 1 }

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

proc max args {
	return [fold n max {$n > $max ? $n : $max} $args]
}

proc factorial n {
	return [prod [mkrange $n 1]]
}

proc flatten args {
	for {set i 0} {$i < [llength args]} {incr i} {
		set j [lindex $args $i]
		if {[llength $j] > 1} {lreplace $args $i $i {*}$j}
	}
	return $args
}

proc tracer args { puts [info level 0] }

