-- HC15T9 - Try Function for File IO Exceptions
import Control.Exception
import System.IO

main :: IO ()
main = do
    putStrLn "Enter filename:"
    f <- getLine
    result <- try (readFile f) :: IO (Either IOError String)
    case result of
        Left _  -> putStrLn "File could not be read."
        Right c -> putStrLn ("File contents:\n" ++ c)

