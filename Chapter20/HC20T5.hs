module Main where

import Control.Monad.Reader

type Config = String

greet :: Reader Config String
greet = do
  name <- ask
  return ("Hello, " ++ name ++ "!")

main :: IO ()
main = print (runReader greet "Alice")

