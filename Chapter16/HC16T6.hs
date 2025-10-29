-- HC16T6: nth Fibonacci Number
fibonacci :: Int -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main :: IO ()
main = do
    putStrLn "HC16T6: nth Fibonacci Number"
    print (fibonacci 10)

