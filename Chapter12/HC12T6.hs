import Data.List (sort)

-- HC12T6
main :: IO ()
main = do
    putStrLn "Enter numbers separated by spaces:"
    line <- getLine
    let nums = map read (words line) :: [Int]
    print (sort nums)
