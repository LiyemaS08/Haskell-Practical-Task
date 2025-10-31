-- HC12T8: Merge Two Sorted Lists

-- Function to merge two sorted lists into a single sorted list
mergeLists :: Ord a => [a] -> [a] -> [a]
mergeLists [] ys = ys
mergeLists xs [] = xs
mergeLists (x:xs) (y:ys)
    | x <= y    = x : mergeLists xs (y:ys)
    | otherwise = y : mergeLists (x:xs) ys

-- Main function for testing
main :: IO ()
main = do
    let list1 = [1, 3, 5, 7]
    let list2 = [2, 4, 6, 8, 10]
    let merged = mergeLists list1 list2
    putStrLn "List 1:"
    print list1
    putStrLn "List 2:"
    print list2
    putStrLn "Merged List:"
    print merged
