-- HC11T2 - Count Characters in a Line
main :: IO ()
main = do
    putStrLn "Enter a line of text:"
    line <- getLine
    putStrLn ("Number of characters: " ++ show (length line))
