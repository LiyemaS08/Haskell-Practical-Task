module Main where

pureAndApply :: Maybe Int
pureAndApply = pure (+3) <*> Just 7

main :: IO ()
main = print pureAndApply

