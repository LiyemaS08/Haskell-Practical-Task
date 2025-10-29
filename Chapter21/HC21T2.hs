module Main where

addThreeApplicative :: Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int
addThreeApplicative a b c = (\x y z -> x + y + z) <$> a <*> b <*> c

main :: IO ()
main = print (addThreeApplicative (Just 2) (Just 3) (Just 4))

