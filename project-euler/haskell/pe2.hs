
import System.Environment
import Lib

main = do
	args <- getArgs 
	let n = if null args
		then 4000000 :: Integer
		else read $ head args :: Integer
	putStrLn $ show $ sum $ filter even $ takeWhile (< n) fibs

-- main = putStrLn $ show $ sum $ filter even $ takeWhile (< 4000000) fibs

