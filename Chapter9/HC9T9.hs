-- HC9T9.hs
data Sequence a = End | Node a (Sequence a) deriving (Show)

elemSeq :: Eq a => a -> Sequence a -> Bool
elemSeq _ End = False
elemSeq x (Node v next)
    | x == v    = True
    | otherwise = elemSeq x next

main :: IO ()
main = do
    let seq1 = Node 1 (Node 2 (Node 3 End))
    print (elemSeq 2 seq1)   -- True
    print (elemSeq 5 seq1)   -- False

