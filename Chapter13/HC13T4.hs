-- Main.hs

-- SumNonEmpty module content
sumNonEmpty :: Num a => [a] -> a
sumNonEmpty [] = error "sumNonEmpty: empty list"
sumNonEmpty xs = sum xs

-- Main program
main :: IO ()
main = do
    let list1 = [1,2,3,4]
    let list2 = []

    putStrLn $ "Sum of list1: " ++ show (sumNonEmpty list1)
    -- This will throw an error
    putStrLn $ "Sum of list2: " ++ show (sumNonEmpty list2)
