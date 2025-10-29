module Main where

applyWithEffects :: Applicative f => f (a -> b) -> f a -> f b
applyWithEffects = (<*>)

main :: IO ()
main = print (applyWithEffects (Just (+2)) (Just 3))

