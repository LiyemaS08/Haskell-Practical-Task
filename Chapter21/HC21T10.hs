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

data VendingState = MkVendingState { items :: Int, credit :: Int } deriving Show

insertCoin :: Int -> State VendingState ()
insertCoin amt = modify (\s -> s { credit = credit s + amt })

vend :: State VendingState String
vend = do
  s <- get
  if items s <= 0
    then return "Sold out!"
    else if credit s < 2
      then return "Insert more coins!"
      else do
        put (s { items = items s - 1, credit = credit s - 2 })
        return "Enjoy your snack!"

getChange :: State VendingState Int
getChange = do
  s <- get
  put (s { credit = 0 })
  return (credit s)

vendingSequence :: State VendingState String
vendingSequence = do
  insertCoin 1
  insertCoin 2
  msg <- vend
  change <- getChange
  return (msg ++ " Change=" ++ show change)

main :: IO ()
main = print (runState vendingSequence (MkVendingState 5 0))
