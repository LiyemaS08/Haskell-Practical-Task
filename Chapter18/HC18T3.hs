-- HC18T3: incrementTreeValues Function
data Tree a = Leaf a | Node (Tree a) (Tree a)
  deriving (Show)

instance Functor Tree where
    fmap f (Leaf x)   = Leaf (f x)
    fmap f (Node l r) = Node (fmap f l) (fmap f r)

incrementTreeValues :: Num a => Tree a -> Tree a
incrementTreeValues = fmap (+1)

main :: IO ()
main = do
    putStrLn "HC18T3: incrementTreeValues"
    let t = Node (Leaf 1) (Node (Leaf 2) (Leaf 3))
    print (incrementTreeValues t)  -- Node (Leaf 2) (Node (Leaf 3) (Leaf 4))

