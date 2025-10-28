-- HC13T4 - SumNonEmpty Module
module SumNonEmpty (sumNonEmpty) where

sumNonEmpty :: [Int] -> Int
sumNonEmpty [] = error "List is empty! Cannot sum."
sumNonEmpty xs = sum xs

