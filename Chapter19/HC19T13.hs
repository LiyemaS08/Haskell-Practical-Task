module Main where

import Control.Monad (when)

whenApplicative :: Bool -> IO () -> IO ()
whenApplicative cond action = when cond action

main :: IO ()
main = whenApplicative True (putStrLn "Running whenApplicative!")

