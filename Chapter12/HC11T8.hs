-- HC12T8
mergeLists :: Ord a => [a] -> [a] -> [a]
mergeLists xs ys = merge (sort xs) (sort ys)
  where
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
        | x < y     = x : merge xs (y:ys)
        | otherwise = y : merge (x:xs) ys

main :: IO ()
main = print (mergeLists [1,3,5] [2,4,6])
