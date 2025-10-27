-- HC9T4.hs
data Box a = Empty | Has a deriving (Show)

extract :: a -> Box a -> a
extract def Empty    = def
extract _   (Has x)  = x

main :: IO ()
main = do
    print (extract 0 (Has 10))   -- 10
    print (extract 0 Empty)      -- 0

