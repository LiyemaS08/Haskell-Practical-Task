-- Function to add two integers
add :: Int -> Int -> Int
add x y = x + y

-- Function to check if a number is even
isEven :: Int -> Bool
isEven n = n `mod` 2 == 0

-- Function to concatenate two strings
concatStrings :: String -> String -> String
concatStrings s1 s2 = s1 ++ s2

-- Main function to run when executing the file
main :: IO ()
main = do
    print (add 3 5)                        -- Output: 8
    print (isEven 4)                       -- Output: True
    print (concatStrings "Hello, " "World!") -- Output: "Hello, World!"

