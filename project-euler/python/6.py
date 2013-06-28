#!/usr/bin/env python

# "difference between the sum of the squares of the first one hundred natural numbers and the square of the sum"

# 21.5 us
def difference_sumsq_sqsum(N):
	square_of_sum  = sum(range(N+1))**2
	sum_of_squares = sum(map(lambda x:x*x, range(N+1)))
	return square_of_sum - sum_of_squares

if __name__ == '__main__':
	print "Answer: " + str(difference_sumsq_sqsum(100))

