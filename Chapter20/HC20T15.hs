module Main where

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

newtype TreeM a = TreeM { runTreeM :: a }

instance Functor TreeM where
  fmap f (TreeM x) = TreeM (f x)

instance Applicative TreeM where
  pure = TreeM
  TreeM f <*> TreeM x = TreeM (f x)

instance Monad TreeM where
  return = TreeM
  TreeM x >>= f = f x

treeSum :: Tree Int -> TreeM Int
treeSum (Leaf n) = return n
treeSum (Node l r) = do
  a <- treeSum l
  b <- treeSum r
  return (a + b)

main :: IO ()
main = print (runTreeM (treeSum (Node (Leaf 3) (Node (Leaf 2) (Leaf 5)))))

