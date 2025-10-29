-- HC17T7: multiplyProducts Function
newtype Product = Product { getProduct :: Int } deriving (Show, Eq)

instance Semigroup Product where
    (Product x) <> (Product y) = Product (x * y)

instance Monoid Product where
    mempty = Product 1

multiplyProducts :: [Product] -> Product
multiplyProducts = mconcat

main :: IO ()
main = do
    putStrLn "HC17T7: multiplyProducts"
    print (multiplyProducts [Product 2, Product 3, Product 4]) -- Product 24

