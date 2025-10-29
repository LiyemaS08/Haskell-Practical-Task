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

-- State (current, history)
setValue :: Int -> State (Int,[Int]) ()
setValue new = do
  (curr, hist) <- get
  put (new, curr:hist)

undo :: State (Int,[Int]) ()
undo = do
  (curr, hist) <- get
  case hist of
    [] -> return ()
    (h:rest) -> put (h, rest)

script :: State (Int,[Int]) Int
script = do
  setValue 10
  setValue 20
  undo
  setValue 30
  (curr, _) <- get
  return curr

main :: IO ()
main = print (runState script (0,[]))
