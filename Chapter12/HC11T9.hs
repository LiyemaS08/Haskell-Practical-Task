import System.IO
import Control.Exception

-- HC12T9
main :: IO ()
main = do
    putStrLn "Enter file name:"
    fileName <- getLine
    content <- try (readFile fileName) :: IO (Either IOError String)
    case content of
        Left _ -> putStrLn "Error: File not found."
        Right text -> putStrLn text
