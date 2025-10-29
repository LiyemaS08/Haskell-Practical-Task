module Main where

sumThreeApplicative :: Either String Int -> Either String Int -> Either String Int -> Either String Int
sumThreeApplicative a b c = (\x y z -> x + y + z) <$> a <*> b <*> c

main :: IO ()
main = print (sumThreeApplicative (Right 2) (Right 3) (Right 4))

