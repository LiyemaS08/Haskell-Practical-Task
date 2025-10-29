module Main where

import Control.Applicative (liftA2)

combineResults :: Either String Int -> Either String Int -> Either String Int
combineResults = liftA2 (+)

main :: IO ()
main = print (combineResults (Right 3) (Right 4))

