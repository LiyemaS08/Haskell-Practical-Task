-- HC11T9 - Sum Two Numbers
main :: IO ()
main = do
    putStrLn "Enter first number:"
    a <- readLn
    putStrLn "Enter second number:"
    b <- readLn
    putStrLn ("Sum: " ++ show (a + b))
