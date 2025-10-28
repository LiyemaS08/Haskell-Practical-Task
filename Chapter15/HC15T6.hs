-- HC15T6 - Safe Input Parsing with readMaybe
import Text.Read (readMaybe)

main :: IO ()
main = do
    putStrLn "Enter an integer:"
    input <- getLine
    case readMaybe input :: Maybe Int of
        Nothing -> putStrLn "Invalid number!"
        Just n  -> putStrLn ("You entered: " ++ show n)

