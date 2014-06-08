
import System.Environment
import Lib

main = do
	args <- getArgs
	let n = if null args
		then 600851475143 
		else read (head args) :: Integer
	putStrLn $ show $ maximum $ factors n

