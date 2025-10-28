-- HC13T5 - Restricted Export
module SumNonEmpty (sumNonEmpty) where

sumNonEmpty :: [Int] -> Int
sumNonEmpty [] = errorMsg
sumNonEmpty xs = sum xs

-- private helper (not exported)
errorMsg :: String
errorMsg = error "List cannot be empty!"

