module Main where

import Control.Monad (when)

conditionalPrint :: Bool -> String -> IO ()
conditionalPrint cond msg = when cond (putStrLn msg)

main :: IO ()
main = conditionalPrint True "Condition is True!"

