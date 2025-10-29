module Main where

import Control.Monad (forever)

repeatEffect :: IO () -> IO ()
repeatEffect action = forever action

main :: IO ()
main = repeatEffect (putStrLn "Repeating forever...")  -- Ctrl+C to stop

