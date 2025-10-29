module Main where

discardSecond :: Applicative f => f a -> f b -> f a
discardSecond = (<*)

main :: IO ()
main = print (discardSecond (Just 5) (Just 10))

