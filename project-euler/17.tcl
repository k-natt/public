#!/usr/bin/tclsh

# PE#17 letters in spelled-out 1-1000

set foo {
	one
	two
	three
	four
	five
	six
	seven
	eight
	nine
}
set bar {
	ten
	eleven
	twelve
	thirteen
	fourteen
	fifteen
	sixteen
	seventeen
	eightteen
	nineteen
}
set baz {
	twenty
	thirty
	forty
	fiftty
	sixty
	seventy
	eighty
	ninety
}

set baz {}

# 1-9
foreach i $foo {
	concat bar $i
}

#10-19
foreach i $bar {
	concat bar $i
}

# 20-99
foreach i $bar {
	foreach j $a {
		concat bar $i$j
	}
}

# 100
foreach i $a {
	concat bar ${i}hundred

	# 1-19
	foreach j $foo {
		concat bar $j
	}

	# 20-99
	foreach j $bar {
		foreach k $a {
			concat bar $j$k
		}
	}
}

