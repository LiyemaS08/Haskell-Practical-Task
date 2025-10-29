module Main where

batchProcessing :: IO ()
batchProcessing =
  getLine >>= \name ->
  putStrLn ("Hello, " ++ name) >>
  putStrLn "Processing complete."

main :: IO ()
main = batchProcessing

