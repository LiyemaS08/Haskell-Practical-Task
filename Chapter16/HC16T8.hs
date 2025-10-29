-- HC16T8: Insertion Sort
insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)
  where
    insert y [] = [y]
    insert y (z:zs)
      | y <= z    = y : z : zs
      | otherwise = z : insert y zs

main :: IO ()
main = do
    putStrLn "HC16T8: Insertion Sort"
    print (insertionSort [3,1,4,1,5,9,2,6])

