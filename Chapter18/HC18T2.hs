-- HC18T2: Functor Instance for Tree
data Tree a = Leaf a | Node (Tree a) (Tree a)
  deriving (Show)

instance Functor Tree where
    fmap f (Leaf x)   = Leaf (f x)
    fmap f (Node l r) = Node (fmap f l) (fmap f r)

main :: IO ()
main = do
    putStrLn "HC18T2: Functor Instance for Tree"
    let t = Node (Leaf 1) (Node (Leaf 2) (Leaf 3))
    print (fmap (*2) t)  -- Node (Leaf 2) (Node (Leaf 4) (Leaf 6))

