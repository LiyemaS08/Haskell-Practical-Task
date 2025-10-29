module Main where

simulateMaybeEffect :: Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int
simulateMaybeEffect a b c = (\x y z -> x * y + z) <$> a <*> b <*> c

main :: IO ()
main = print (simulateMaybeEffect (Just 2) (Just 3) (Just 4))

