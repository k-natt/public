
import Lib

main = putStrLn $ show $ sum $ takeWhile (< 4000000) (sieve [2..])

