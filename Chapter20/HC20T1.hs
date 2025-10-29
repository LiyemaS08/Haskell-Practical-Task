module Main where

safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide x y = Just (x `div` y)

main :: IO ()
main = do
  print (safeDivide 10 2)
  print (safeDivide 10 0)

