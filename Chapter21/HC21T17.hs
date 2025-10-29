module Main where
import qualified Data.Map as M
import Data.Monoid

-- Legacy style
legacyProcess :: M.Map String String -> Int -> (String, [String], Int)
legacyProcess env count =
  let port = M.findWithDefault "unknown" "PORT" env
      msg = "Using port " ++ port
      newCount = count + 1
  in (msg, ["Log: " ++ msg], newCount)

-- Refactored with Reader + Writer + State
newtype Reader r a = Reader { runReader :: r -> a }
instance Functor (Reader r) where fmap f (Reader g)=Reader(f . g)
instance Applicative (Reader r) where
  pure a = Reader(\_ -> a)
  Reader f <*> Reader g = Reader(\r -> f r (g r))
instance Monad (Reader r) where
  Reader g >>= f = Reader(\r -> runReader (f (g r)) r)
ask :: Reader r r
ask = Reader id

newtype Writer w a = Writer { runWriter :: (a, w) }
instance Functor (Writer w) where fmap f (Writer (a,w))=Writer(f a,w)
instance Monoid w => Applicative (Writer w) where
  pure a = Writer(a,mempty)
  Writer (f,w1) <*> Writer(a,w2)=Writer(f a,w1<>w2)
instance Monoid w => Monad (Writer w) where
  Writer (a,w1) >>= f = let Writer (b,w2)=f a in Writer(b,w1<>w2)
tell :: Monoid w => w -> Writer w ()
tell w = Writer((),w)

newtype State s a = MkState { runState :: s -> (a, s) }
instance Functor (State s) where fmap f (MkState g)=MkState(\s->let(a,s')=g s in(f a,s'))
instance Applicative (State s) where
  pure a = MkState(\s->(a,s))
  MkState f <*> MkState g = MkState(\s->let(func,s1)=f s;(a,s2)=g s1 in(func a,s2))
instance Monad (State s) where
  MkState g >>= f = MkState(\s->let(a,s1)=g s;MkState h=f a in h s1)
get :: State s s; get = MkState(\s->(s,s))
put :: s -> State s (); put s = MkState(\_->((),s))
modify :: (s->s) -> State s (); modify f = MkState(\s->((),f s))

process :: Reader (M.Map String String) (State Int (Writer [String] String))
process = do
  env <- ask
  return $ do
    count <- get
    let port = M.findWithDefault "unknown" "PORT" env
        msg = "Using port " ++ port
    modify (+1)
    return (tell ["Log: " ++ msg] >> Writer (msg, []))

main :: IO ()
main = do
  let env = M.fromList [("PORT","8080")]
      (writer, count') = runState (runReader process env) 0
      (result, logs) = runWriter writer
  print ("Result:", result)
  print ("Logs:", logs)
  print ("Count:", count')
