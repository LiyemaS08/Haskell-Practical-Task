-- HC9T8.hs
data Sequence a = End | Node a (Sequence a) deriving (Show)

main :: IO ()
main = do
    let seq1 = Node 1 (Node 2 (Node 3 End))
    print seq1

