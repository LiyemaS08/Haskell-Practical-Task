module Main where

import Control.Monad.State
import qualified Data.Map as M

type Memo = M.Map Int Integer

fibonacciMemo :: Int -> State Memo Integer
fibonacciMemo 0 = return 0
fibonacciMemo 1 = return 1
fibonacciMemo n = do
  memo <- get
  case M.lookup n memo of
    Just v  -> return v
    Nothing -> do
      a <- fibonacciMemo (n - 1)
      b <- fibonacciMemo (n - 2)
      let val = a + b
      modify (M.insert n val)
      return val

main :: IO ()
main = print (evalState (fibonacciMemo 10) M.empty)

