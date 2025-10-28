-- HC11T3 - Double a Number
main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    let num = read input :: Int
    putStrLn ("Double: " ++ show (num * 2))
