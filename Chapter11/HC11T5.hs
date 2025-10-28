-- HC11T5 - Repeat Until "quit"
main :: IO ()
main = loop
  where
    loop = do
        putStr "Enter text (or 'quit' to exit): "
        input <- getLine
        if input == "quit"
            then putStrLn "Goodbye!"
            else do putStrLn ("You said: " ++ input)
                    loop
