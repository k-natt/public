-- Multiples of 3 or 5 below 1000

import System.Environment

good x = x `mod` 3 == 0 || x `mod` 5 == 0

main = do
	args <- getArgs
	let n = if null args
		then 1000 
		else read (head args) :: Int
	putStrLn $ show $ sum $ filter good [1..(n-1)]

--main = do
--	let n = 1000
--	let l = [1..(n-1)]
--	let cond x = x `mod` 3 == 0 || x `mod` 5 == 0
--	let g = filter cond l
--	let s = sum g
--	let ss = show s
--	putStrLn ss

--main = putStrLn $ show $ sum $ filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1..999]

