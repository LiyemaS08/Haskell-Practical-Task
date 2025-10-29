module Main where

sequenceApplicative :: [Maybe a] -> Maybe [a]
sequenceApplicative = sequenceA

main :: IO ()
main = print (sequenceApplicative [Just 1, Just 2, Just 3])

