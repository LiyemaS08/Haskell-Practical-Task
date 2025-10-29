-- HC17T2: Min and Max Newtypes with Semigroup
newtype Min a = Min { getMin :: a } deriving (Show, Eq)
newtype Max a = Max { getMax :: a } deriving (Show, Eq)

instance Ord a => Semigroup (Min a) where
    (Min x) <> (Min y) = Min (min x y)

instance Ord a => Semigroup (Max a) where
    (Max x) <> (Max y) = Max (max x y)

main :: IO ()
main = do
    putStrLn "HC17T2: Min and Max Semigroups"
    print (Min 5 <> Min 3)   -- Min 3
    print (Max 5 <> Max 3)   -- Max 5

