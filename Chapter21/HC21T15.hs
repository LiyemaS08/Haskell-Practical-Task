module Main where

-- Reader and State combo
newtype Reader r a = Reader { runReader :: r -> a }
instance Functor (Reader r) where fmap f (Reader g) = Reader (f . g)
instance Applicative (Reader r) where
  pure a = Reader (\_ -> a)
  Reader f <*> Reader g = Reader (\r -> f r (g r))
instance Monad (Reader r) where
  return = pure
  Reader g >>= f = Reader (\r -> runReader (f (g r)) r)

newtype State s a = MkState { runState :: s -> (a, s) }
instance Functor (State s) where
  fmap f (MkState g) = MkState (\s -> let (a,s')=g s in (f a,s'))
instance Applicative (State s) where
  pure a = MkState (\s -> (a,s))
  MkState f <*> MkState g = MkState (\s -> let (func,s1)=f s; (a,s2)=g s1 in (func a,s2))
instance Monad (State s) where
  return = pure
  MkState g >>= f = MkState (\s -> let (a,s1)=g s; MkState h=f a in h s1)

get :: State s s
get = MkState (\s -> (s,s))
put :: s -> State s ()
put s = MkState (\_ -> ((),s))

data Config = Config { threshold :: Int }

tick :: Reader Config (State Int Bool)
tick = do
  cfg <- Reader id
  return $ MkState (\count ->
    let newCount = count + 1
    in (newCount >= threshold cfg, newCount))

runTicks :: Reader Config [Bool]
runTicks = do
  t <- tick
  t2 <- tick
  return [fst (runState t 0), fst (runState t2 1)]

main :: IO ()
main = do
  print (runReader runTicks (Config 2))
  print (runReader runTicks (Config 5))
