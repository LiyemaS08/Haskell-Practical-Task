-- HC17T4: Monoid Instance for Sum
newtype Sum = Sum { getSum :: Int } deriving (Show, Eq)

instance Semigroup Sum where
    (Sum x) <> (Sum y) = Sum (x + y)

instance Monoid Sum where
    mempty = Sum 0

main :: IO ()
main = do
    putStrLn "HC17T4: Monoid for Sum"
    print (mconcat [Sum 1, Sum 2, Sum 3])  -- Sum 6
    print (mempty <> Sum 10)                -- Sum 10

