module Main where

sequenceMaybe :: [Maybe a] -> Maybe [a]
sequenceMaybe = sequenceA

main :: IO ()
main = do
  print (sequenceMaybe [Just 1, Just 2, Just 3])
  print (sequenceMaybe [Just 1, Nothing, Just 3])

