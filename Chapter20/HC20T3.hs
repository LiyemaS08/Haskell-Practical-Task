module Main where

import Control.Monad.Writer

add :: Int -> Int -> Writer [String] Int
add x y = tell ["Adding " ++ show x ++ " and " ++ show y] >> return (x + y)

multiply :: Int -> Int -> Writer [String] Int
multiply x y = tell ["Multiplying " ++ show x ++ " and " ++ show y] >> return (x * y)

calculator :: Writer [String] Int
calculator = do
  a <- add 3 5
  b <- multiply a 2
  return b

main :: IO ()
main = do
  let (result, logMsgs) = runWriter calculator
  print result
  mapM_ putStrLn logMsgs

