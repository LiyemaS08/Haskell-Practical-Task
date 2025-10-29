-- HC17T5: combineLists Function
combineLists :: [Int] -> [Int] -> [Int]
combineLists xs ys = xs <> ys  -- Uses Semigroup (list concatenation)

main :: IO ()
main = do
    putStrLn "HC17T5: combineLists"
    print (combineLists [1,2,3] [4,5,6])  -- [1,2,3,4,5,6]

