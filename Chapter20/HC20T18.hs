module Main where

import Control.Monad.Trans.Maybe
import Control.Monad.IO.Class

getValidatedInput :: MaybeT IO String
getValidatedInput = do
  liftIO (putStrLn "Enter a non-empty name:")
  name <- liftIO getLine
  if null name then MaybeT (return Nothing) else return name

main :: IO ()
main = do
  result <- runMaybeT getValidatedInput
  case result of
    Just name -> putStrLn ("Hello, " ++ name)
    Nothing   -> putStrLn "Invalid input!"

