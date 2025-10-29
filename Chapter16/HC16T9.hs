-- HC16T9: Remove Duplicates from List
import Data.List (nub)

removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates xs = nub xs

main :: IO ()
main = do
    putStrLn "HC16T9: Remove Duplicates from List"
    print (removeDuplicates [1,2,2,3,3,4,4,4])

