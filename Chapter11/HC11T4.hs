-- HC11T4 - Concatenate Two Lines
main :: IO ()
main = do
    putStrLn "Enter first line:"
    line1 <- getLine
    putStrLn "Enter second line:"
    line2 <- getLine
    putStrLn ("Concatenated: " ++ line1 ++ line2)
