
import System.Environment

import Lib


main = do
	args <- getArgs
	let n = if null args
		then 100
		else read (head args) :: Integer
	let combos = map (\x -> map (\y -> x * y) [x..n]) [(n`div`10)..(n-1)]
	putStrLn . show $ maximum $ filter paln $ concat combos

