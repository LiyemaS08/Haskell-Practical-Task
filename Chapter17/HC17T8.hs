-- HC17T8: foldWithSemigroup Function
foldWithSemigroup :: Semigroup a => [a] -> a
foldWithSemigroup = foldr1 (<>)

main :: IO ()
main = do
    putStrLn "HC17T8: foldWithSemigroup"
    print (foldWithSemigroup ["Hello", " ", "World"]) -- "Hello World"

