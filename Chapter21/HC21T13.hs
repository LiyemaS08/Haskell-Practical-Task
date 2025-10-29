module Main where

-- Reader
newtype Reader r a = Reader { runReader :: r -> a }
instance Functor (Reader r) where fmap f (Reader g) = Reader (f . g)
instance Applicative (Reader r) where
  pure a = Reader (\_ -> a)
  Reader f <*> Reader g = Reader (\r -> f r (g r))
instance Monad (Reader r) where
  return = pure
  Reader g >>= f = Reader (\r -> runReader (f (g r)) r)

-- Writer
newtype Writer w a = Writer { runWriter :: (a, w) }
instance Functor (Writer w) where fmap f (Writer (a,w)) = Writer (f a,w)
instance Monoid w => Applicative (Writer w) where
  pure a = Writer (a,mempty)
  Writer (f,w1) <*> Writer (a,w2) = Writer (f a,w1<>w2)
instance Monoid w => Monad (Writer w) where
  return = pure
  Writer (a,w1) >>= f = let Writer (b,w2)=f a in Writer (b,w1<>w2)

tell :: Monoid w => w -> Writer w ()
tell w = Writer ((),w)

-- Configurable Reader
data Config = Config { prefix :: String }

step :: String -> Reader Config (Writer [String] ())
step msg = do
  cfg <- Reader id
  return (tell [prefix cfg ++ msg])

demo :: Reader Config (Writer [String] ())
demo = do
  a <- step "Start"
  b <- step "Processing"
  c <- step "Done"
  return (a >> b >> c)

main :: IO ()
main = print (runWriter (runReader demo (Config "[LOG] ")))
