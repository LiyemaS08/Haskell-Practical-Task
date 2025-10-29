module Main where

-- Reader definition
newtype Reader r a = Reader { runReader :: r -> a }

-- Functor, Applicative, Monad instances
instance Functor (Reader r) where
  fmap f (Reader g) = Reader (f . g)

instance Applicative (Reader r) where
  pure a = Reader (\_ -> a)
  Reader f <*> Reader g = Reader (\r -> f r (g r))

instance Monad (Reader r) where
  return = pure
  Reader g >>= f = Reader (\r -> runReader (f (g r)) r)

-- Config type
data Config = Config { prefix :: String, suffix :: String }

-- Two Reader actions using same environment
hello :: Reader Config String
hello = do
  cfg <- Reader id
  return (prefix cfg ++ " world" ++ suffix cfg)

goodbye :: Reader Config String
goodbye = do
  cfg <- Reader id
  return (prefix cfg ++ " goodbye" ++ suffix cfg)

composeDemo :: Reader Config String
composeDemo = do
  a <- hello
  b <- goodbye
  return (a ++ " | " ++ b)

main :: IO ()
main = print (runReader composeDemo (Config "<<" ">>"))
