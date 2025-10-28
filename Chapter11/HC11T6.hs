import Data.Char (toUpper)

-- HC11T6 - Uppercase Converter
main :: IO ()
main = do
    putStrLn "Enter text:"
    line <- getLine
    putStrLn (map toUpper line)
