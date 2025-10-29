module Main where

doubleMonad :: Maybe [Int] -> Maybe [Int]
doubleMonad mxs = do
  xs <- mxs
  return (xs ++ xs)

main :: IO ()
main = print (doubleMonad (Just [1,2,3]))

