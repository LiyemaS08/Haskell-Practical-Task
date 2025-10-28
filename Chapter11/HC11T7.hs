-- HC11T7 - User Options
main :: IO ()
main = do
    putStrLn "Choose an option: (1) Greet (2) Add numbers"
    choice <- getLine
    case choice of
        "1" -> putStrLn "Hello there!"
        "2" -> do
            putStrLn "Enter two numbers:"
            a <- readLn
            b <- readLn
            putStrLn ("Sum: " ++ show (a + b))
        _ -> putStrLn "Invalid option."
