-- HC11T10 - Reverse User Input
main :: IO ()
main = do
    putStrLn "Enter text:"
    line <- getLine
    putStrLn ("Reversed: " ++ reverse line)
