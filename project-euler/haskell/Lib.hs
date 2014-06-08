
module Lib where
import qualified Data.Map as Map

-- Fibonacci number generator
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- Factors of a number
facthelp :: Integer -> Integer -> [Integer]
facthelp n f
	| n == 1         = []
	| n `mod` f == 0 = f : (facthelp (n `div` f) f)
	| otherwise      = facthelp n (f + 1)

factors :: Integer -> [Integer]
factors n = facthelp n 2

-- Palindromic numbers and arrays
paln :: (Show a0) => a0 -> Bool
paln i = (show i) == reverse (show i)

palindrome :: (Eq a0) => [a0] -> Bool
palindrome l = l == reverse l

-- Prime generator
filt :: Integer -> [Integer] -> [Integer]
filt f (x:xs)
	| x `mod` f == 0 = filt f xs
	| otherwise  = x : filt f xs

primehelper :: [Integer] -> [Integer]
primehelper (fact:rest) = fact : (primehelper $ filt fact rest)

primes :: [Integer]
primes = primehelper [2..]

-- Prime gen 2 (www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf)
sieve xs = sieve' xs Map.empty where
	sieve' []     table = []
	sieve' (x:xs) table = 
		case Map.lookup x table of 
			Nothing -> x : sieve' xs (Map.insert (x*x) [x] table)
			Just facts -> sieve' xs (foldl reinsert (Map.delete x table) facts)
		where
			reinsert table prime = Map.insertWith (++) (x+prime) [prime] table


