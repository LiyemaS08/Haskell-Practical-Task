-- HC7T10.hs
data Shape = Circle Double | Rectangle Double Double
    deriving (Show, Eq, Ord)

class Describable a where
    describe :: a -> String

instance Describable Shape where
    describe (Circle r) = "A circle with radius " ++ show r
    describe (Rectangle w h) = "A rectangle " ++ show w ++ " by " ++ show h

describeAndCompare :: (Describable a, Ord a) => a -> a -> String
describeAndCompare x y = describe (max x y)

main :: IO ()
main = do
    let s1 = Circle 5
    let s2 = Rectangle 3 8
    putStrLn (describeAndCompare s1 s2)

