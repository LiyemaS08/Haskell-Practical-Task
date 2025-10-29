module Main where

findFirst :: (a -> Bool) -> [a] -> Either String a
findFirst _ [] = Left "No match found"
findFirst p (x:xs)
  | p x       = Right x
  | otherwise = findFirst p xs

main :: IO ()
main = do
  print (findFirst even [1,3,4,5])
  print (findFirst (>10) [1,2,3])

