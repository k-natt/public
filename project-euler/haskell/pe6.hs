import System.Environment

main = do
	args <- getArgs
	let n = if null args
		then 100
		else read (head args) :: Integer
	let range = [1..n]
	let sosq = sum $ map (^2) range
	let sqos = (sum range) ^ 2
	putStrLn $ show $ sqos - sosq

