module Main where

import Control.Monad.Writer

logFunction :: (Show a) => String -> a -> Writer [String] a
logFunction name x = tell ["Called " ++ name ++ " with " ++ show x] >> return x

systemProcess :: Writer [String] Int
systemProcess = do
  a <- logFunction "step1" 10
  b <- logFunction "step2" (a * 2)
  return b

main :: IO ()
main = do
  let (res, logs) = runWriter systemProcess
  print res
  mapM_ putStrLn logs

