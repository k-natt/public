
main = do 
	let n = 1000
	let all = [(x*y*(n-x-y),x,y,n-x-y) | x <- [(n`div`3)..(n`div`2)], y <- [1..(x`div`2)], x^2==y^2+(n-x-y)^2]
	--map (putStrLn . show) all
	putStrLn $ show all

