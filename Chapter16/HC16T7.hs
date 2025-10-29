-- HC16T7: Element Existence in List
elementExists :: (Eq a) => a -> [a] -> Bool
elementExists x xs = x `elem` xs

main :: IO ()
main = do
    putStrLn "HC16T7: Element Existence in List"
    print (elementExists 3 [1,2,3,4,5])
    print (elementExists 9 [1,2,3,4,5])

