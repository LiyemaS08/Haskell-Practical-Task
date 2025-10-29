module Main where
import Data.Monoid

newtype Writer w a = Writer { runWriter :: (a, w) }

instance Functor (Writer w) where
  fmap f (Writer (a,w)) = Writer (f a,w)
instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a,mempty)
  Writer (f,w1) <*> Writer (a,w2) = Writer (f a,w1<>w2)
instance Monoid w => Monad (Writer w) where
  Writer (a,w1) >>= f = let Writer (b,w2)=f a in Writer (b,w1<>w2)

tell :: Monoid w => w -> Writer w ()
tell w = Writer ((),w)

-- Count steps instead of storing messages
stepCount :: Int -> Writer (Sum Int) Int
stepCount x = Writer (x+1, Sum 1)

main :: IO ()
main = do
  let Writer (result, Sum count) = do
        a <- stepCount 3
        b <- stepCount a
        return b
  putStrLn $ "Result=" ++ show result ++ ", Steps=" ++ show count
