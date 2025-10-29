module Main where
import Data.Monoid

-- Writer
newtype Writer w a = Writer { runWriter :: (a, w) }
instance Functor (Writer w) where fmap f (Writer (a,w)) = Writer (f a,w)
instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a,mempty)
  Writer (f,w1) <*> Writer (a,w2) = Writer (f a,w1<>w2)
instance Monoid w => Monad (Writer w) where
  Writer (a,w1) >>= f = let Writer (b,w2)=f a in Writer (b,w1<>w2)
tell :: Monoid w => w -> Writer w ()
tell w = Writer ((),w)

lawWriterAssoc :: (Eq a, Monoid w) => Writer w a -> (a -> Writer w a) -> (a -> Writer w a) -> Bool
lawWriterAssoc m k h = runWriter ((m >>= k) >>= h) == runWriter (m >>= (\x -> k x >>= h))

-- Reader
newtype Reader r a = Reader { runReader :: r -> a }
instance Functor (Reader r) where fmap f (Reader g) = Reader (f . g)
instance Applicative (Reader r) where
  pure a = Reader (\_ -> a)
  Reader f <*> Reader g = Reader (\r -> f r (g r))
instance Monad (Reader r) where
  Reader g >>= f = Reader (\r -> runReader (f (g r)) r)

ask :: Reader r r
ask = Reader id
local :: (r->r) -> Reader r a -> Reader r a
local f (Reader g) = Reader (g . f)

lawLocal1 :: Eq a => Reader r a -> r -> Bool
lawLocal1 m env = runReader (local id m) env == runReader m env

main :: IO ()
main = do
  let m = Writer (5, ["a"])
      k x = Writer (x+1, ["k"])
      h x = Writer (x*2, ["h"])
  print (lawWriterAssoc m k h)
  print (lawLocal1 (Reader (*2)) 10)
