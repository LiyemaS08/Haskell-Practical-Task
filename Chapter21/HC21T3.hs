module Main where

safeProduct :: [Maybe Int] -> Maybe Int
safeProduct xs = product <$> sequenceA xs

main :: IO ()
main = print (safeProduct [Just 2, Just 3, Just 4])

