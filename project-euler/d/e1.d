#!/usr/local/bin/rdmd

import std.stdio;
import std.conv;

void main(char[][]args) {
	int N = 1000;
	if (args.length > 1) {
		N = to!int(args[1]);
	}
	int sum = 0;
	foreach (i; 1 .. N) {
		if (i % 3 == 0 || i % 5 == 0) {
			sum += i;
		}
	}
	writeln(sum);
}
