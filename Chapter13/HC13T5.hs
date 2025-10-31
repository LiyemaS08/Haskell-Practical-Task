-- Main.hs

-- SumNonEmpty function
sumNonEmpty :: Num a => [a] -> a
sumNonEmpty [] = error "sumNonEmpty: empty list"
sumNonEmpty xs = sum xs

main :: IO ()
main = do
    let list1 = [1,2,3,4]
    putStrLn $ "Sum of list1: " ++ show (sumNonEmpty list1)

    let list2 = []          -- OK now, because we do something with it next
    putStrLn "Trying to sum list2..."
    -- Uncomment the next line to see the error on empty list
    -- putStrLn $ "Sum of list2: " ++ show (sumNonEmpty list2)
