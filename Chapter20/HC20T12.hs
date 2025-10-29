module Main where

fileRead :: FilePath -> IO ()
fileRead path = do
  contents <- readFile path
  mapM_ putStrLn (lines contents)

main :: IO ()
main = fileRead "example.txt"

