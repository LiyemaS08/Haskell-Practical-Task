-- HC12T9: Read and Print File Content

import System.IO
import System.IO.Error (catchIOError)

-- Function to read and print file content safely
readAndPrintFile :: FilePath -> IO ()
readAndPrintFile path = do
    contentOrError <- tryReadFile path
    case contentOrError of
        Left errMsg -> putStrLn $ "Error: " ++ errMsg
        Right content -> putStrLn content

-- Helper function that tries to read a file and catches errors
tryReadFile :: FilePath -> IO (Either String String)
tryReadFile path = catchIOError
    (do
        contents <- readFile path
        return (Right contents))
    (\e -> return (Left ("Could not read file: " ++ show e)))

-- Main function for testing
main :: IO ()
main = do
    putStrLn "Enter the file name to read:"
    fileName <- getLine
    readAndPrintFile fileName
