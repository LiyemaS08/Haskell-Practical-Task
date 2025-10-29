module Main where

import Control.Monad (forever)

replicateForever :: IO () -> IO ()
replicateForever = forever

main :: IO ()
main = replicateForever (putStrLn "Running forever...")  -- Ctrl+C to stop

