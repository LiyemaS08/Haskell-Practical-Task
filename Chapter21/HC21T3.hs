module Main where
import Data.Monoid

newtype Writer w a = Writer { runWriter :: (a, w) } deriving Show

instance Functor (Writer w) where
  fmap f (Writer (a,w)) = Writer (f a,w)
instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a,mempty)
  Writer (f,w1) <*> Writer (a,w2) = Writer (f a,w1<>w2)
instance Monoid w => Monad (Writer w) where
  return = pure
  Writer (a,w1) >>= f = let Writer (b,w2)=f a in Writer (b,w1<>w2)

tell :: Monoid w => w -> Writer w ()
tell w = Writer ((), w)

listen :: Monoid w => Writer w a -> Writer w (a,w)
listen (Writer (a,w)) = Writer ((a,w), w)

pass :: Monoid w => Writer w (a,w -> w) -> Writer w a
pass (Writer ((a,f),w)) = Writer (a, f w)

demo :: Writer [String] String
demo = pass $ do
  tell ["User entered secret password","Another line"]
  return ("Done", filter (not . ("secret" `elem`) . words))

main :: IO ()
main = print (runWriter demo)
