module Main where

import Control.Monad.State

countChars :: Char -> String -> State Int ()
countChars _ [] = return ()
countChars c (x:xs)
  | c == x    = modify (+1) >> countChars c xs
  | otherwise = countChars c xs

main :: IO ()
main = print $ execState (countChars 'a' "bananas") 0

