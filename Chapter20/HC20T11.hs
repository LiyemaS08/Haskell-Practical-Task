module Main where

import Control.Monad.State
import System.Random

type Position = (Int, Int)
type Walk = StateT Position IO ()

randomWalk :: Int -> Walk
randomWalk 0 = return ()
randomWalk n = do
  (x,y) <- get
  dir <- liftIO $ randomRIO (1,4 :: Int)
  let pos' = case dir of
        1 -> (x+1,y)
        2 -> (x-1,y)
        3 -> (x,y+1)
        _ -> (x,y-1)
  liftIO (print pos')
  put pos'
  randomWalk (n-1)

main :: IO ()
main = evalStateT (randomWalk 5) (0,0)

