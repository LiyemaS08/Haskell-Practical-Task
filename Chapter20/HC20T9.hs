module Main where

import Data.Functor.Identity

replicateMonad :: Int -> a -> Identity [a]
replicateMonad n x = return (replicate n x)

main :: IO ()
main = print (runIdentity (replicateMonad 4 'z'))

