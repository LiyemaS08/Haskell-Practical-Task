module Main where
import Data.Monoid

newtype Writer w a = Writer { runWriter :: (a, w) }

instance Functor (Writer w) where
  fmap f (Writer (a, w)) = Writer (f a, w)

instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a, mempty)
  Writer (f, w1) <*> Writer (a, w2) = Writer (f a, w1 <> w2)

instance Monoid w => Monad (Writer w) where
  return = pure
  Writer (a, w1) >>= f =
    let Writer (b, w2) = f a
    in Writer (b, w1 <> w2)

tell :: Monoid w => w -> Writer w ()
tell w = Writer ((), w)

-- quick law check
lawAssoc :: (Eq a, Monoid w) => Writer w a -> (a -> Writer w a) -> (a -> Writer w a) -> Bool
lawAssoc m k h = runWriter ((m >>= k) >>= h) == runWriter (m >>= (\x -> k x >>= h))

main :: IO ()
main = do
  let m = Writer (5, ["start"])
      k x = Writer (x + 1, ["+1"])
      h x = Writer (x * 2, ["*2"])
  print (lawAssoc m k h)
