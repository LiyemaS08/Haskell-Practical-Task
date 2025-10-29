-- HC18T10: nestedFmap Function
nestedFmap :: (a -> b) -> [[a]] -> [[b]]
nestedFmap = fmap . fmap

main :: IO ()
main = do
    putStrLn "HC18T10: nestedFmap"
    print (nestedFmap (*2) [[1,2],[3,4]])  -- [[2,4],[6,8]]

