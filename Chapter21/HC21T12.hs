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

-- randomStep: seed & position
randomStep :: State (Int,(Int,Int)) ()
randomStep = MkState $ \(seed,(x,y)) ->
  let newSeed = (seed * 1103515245 + 12345) `mod` 256
      dir = newSeed `mod` 4
      (x',y') = case dir of
        0 -> (x+1,y)
        1 -> (x-1,y)
        2 -> (x,y+1)
        _ -> (x,y-1)
  in ((), (newSeed,(x',y')))

randomWalk :: Int -> State (Int,(Int,Int)) [(Int,Int)]
randomWalk 0 = do
  (_,pos) <- MkState (\s -> (s,s))  -- identity
  return [snd s | s <- [snd (runState (MkState id) (0,(0,0)))]]
randomWalk n = do
  randomStep
  MkState $ \(seed,pos) ->
    let (path, st') = runState (randomWalk (n-1)) (seed,pos)
    in (pos:path, st')

main :: IO ()
main = do
  let (path, _) = runState (randomWalk 5) (42,(0,0))
  print path
