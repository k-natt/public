

import System.Environment
import Data.List
import qualified Data.Map as Map
import Lib


main = do
	args <- getArgs
	let n = if null args
		then 20
		else read (head args) :: Integer
	let facts  = concat $ map (group . factors) [2..n]
	let pairs  = map (\xs@(x:_) -> (x,length xs)) facts
	let counts = Map.fromListWith (\x y -> maximum [x,y]) pairs
	putStrLn $ show $ Map.foldWithKey (\k v a -> a*k^v) 1 counts

