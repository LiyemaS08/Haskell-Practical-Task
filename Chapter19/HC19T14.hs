module Main where

import Control.Monad (replicateM)

replicateEffect :: Int -> IO a -> IO [a]
replicateEffect n action = replicateM n action

main :: IO ()
main = do
  xs <- replicateEffect 3 (putStrLn "Hi" >> return 42)
  print xs

