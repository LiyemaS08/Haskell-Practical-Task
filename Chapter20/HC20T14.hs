module Main where

mapMFilter :: Monad m => (a -> m (Maybe b)) -> [a] -> m [b]
mapMFilter _ [] = return []
mapMFilter f (x:xs) = do
  mx <- f x
  rest <- mapMFilter f xs
  return (maybe rest (:rest) mx)

main :: IO ()
main = print =<< mapMFilter (\x -> return (if even x then Just x else Nothing)) [1..10]

