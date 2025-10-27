-- HC9T10.hs
data BST a
  = Empty
  | Node a (BST a) (BST a)
  deriving (Show)

main :: IO ()
main = do
    let tree = Node 10 (Node 5 Empty Empty) (Node 15 Empty Empty)
    print tree

