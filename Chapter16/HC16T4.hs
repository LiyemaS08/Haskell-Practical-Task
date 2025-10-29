-- HC16T4: Filter Even Numbers
filterEven :: [Int] -> [Int]
filterEven xs = filter even xs

main :: IO ()
main = do
    putStrLn "HC16T4: Filter Even Numbers"
    print (filterEven [1..10])

