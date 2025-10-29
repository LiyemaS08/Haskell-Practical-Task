module Main where

import Control.Applicative (liftA2)

liftAndMultiply :: Maybe Int -> Maybe Int -> Maybe Int
liftAndMultiply = liftA2 (*)

main :: IO ()
main = print (liftAndMultiply (Just 3) (Just 4))

