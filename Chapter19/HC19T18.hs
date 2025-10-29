module Main where

combineEitherResults :: Either String Int -> Either String Int -> Either String Int -> Either String Int
combineEitherResults a b c = (\x y z -> x + y + z) <$> a <*> b <*> c

main :: IO ()
main = print (combineEitherResults (Right 1) (Right 2) (Right 3))

