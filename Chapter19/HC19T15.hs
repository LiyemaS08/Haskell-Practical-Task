module Main where

sequenceEffects :: Applicative f => [f a] -> f [a]
sequenceEffects = sequenceA

main :: IO ()
main = print (sequenceEffects [Just 1, Just 2, Just 3])

