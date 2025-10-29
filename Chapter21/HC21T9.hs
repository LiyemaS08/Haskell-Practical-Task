module Main where

newtype State s a = MkState { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (MkState g) = MkState (\s -> let (a,s')=g s in (f a,s'))
instance Applicative (State s) where
  pure a = MkState (\s -> (a,s))
  MkState f <*> MkState g = MkState (\s ->
    let (func,s1)=f s; (a,s2)=g s1 in (func a,s2))
instance Monad (State s) where
  return=pure
  MkState g >>= f = MkState (\s -> let (a,s1)=g s; MkState h=f a in h s1)

get :: State s s
get = MkState (\s -> (s,s))
put :: s -> State s ()
put s = MkState (\_ -> ((),s))
modify :: (s -> s) -> State s ()
modify f = MkState (\s -> ((), f s))

mapCount :: (a -> b) -> [a] -> State Int [b]
mapCount _ [] = return []
mapCount f (x:xs) = do
  modify (+1)
  rest <- mapCount f xs
  return (f x : rest)

main :: IO ()
main = print (runState (mapCount (*2) [1,2,3,4]) 0)
