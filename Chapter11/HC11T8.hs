-- HC11T8 - Even or Odd Checker
main :: IO ()
main = do
    putStrLn "Enter a number:"
    n <- readLn
    putStrLn (if even n then "Even" else "Odd")
