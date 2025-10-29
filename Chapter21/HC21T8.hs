module Main where

-- Basic State type
newtype State s a = MkState { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (MkState g) = MkState (\s -> let (a,s') = g s in (f a, s'))

instance Applicative (State s) where
  pure a = MkState (\s -> (a,s))
  MkState f <*> MkState g = MkState (\s ->
    let (func,s1) = f s
        (a,s2) = g s1
    in (func a, s2))

instance Monad (State s) where
  return = pure
  MkState g >>= f = MkState (\s ->
    let (a,s1) = g s
        MkState h = f a
    in h s1)

-- State helpers
get :: State s s
get = MkState (\s -> (s,s))

put :: s -> State s ()
put s = MkState (\_ -> ((),s))

modify :: (s -> s) -> State s ()
modify f = MkState (\s -> ((), f s))

-- Example
counter :: State Int String
counter = do
  modify (+1)
  x <- get
  return ("Count is now " ++ show x)

main :: IO ()
main = print (runState counter 0)
