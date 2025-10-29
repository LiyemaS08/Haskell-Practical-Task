module Main where

import Control.Monad.State
import Control.Monad.Trans.Maybe

type MyState = StateT Int (MaybeT IO)

incrementIfEven :: MyState ()
incrementIfEven = do
  n <- get
  if even n then put (n + 1) else lift (MaybeT (return Nothing))

main :: IO ()
main = do
  result <- runMaybeT (runStateT incrementIfEven 4)
  print result

