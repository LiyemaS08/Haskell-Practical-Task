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

-- State inside Writer (State s (Writer [String] a))
newtype State s a = MkState { runState :: s -> (a, s) }

instance Functor (State s) where
  fmap f (MkState g) = MkState (\s -> let (a,s')=g s in (f a,s'))
instance Applicative (State s) where
  pure a = MkState (\s -> (a,s))
  MkState f <*> MkState g = MkState (\s -> let (func,s1)=f s; (a,s2)=g s1 in (func a,s2))
instance Monad (State s) where
  return = pure
  MkState g >>= f = MkState (\s -> let (a,s1)=g s; MkState h=f a in h s1)

-- instrumented state
inc :: State Int (Writer [String] ())
inc = MkState (\s -> (tell ["inc from " ++ show s], s+1))

dec :: State Int (Writer [String] ())
dec = MkState (\s -> (tell ["dec from " ++ show s], s-1))

runDemo :: State Int (Writer [String] ())
runDemo = do
  a <- inc
  b <- dec
  return (a >> b)

main :: IO ()
main = do
  let (logAction, newState) = runState runDemo 0
  print ("New State:", newState)
  print (runWriter logAction)
