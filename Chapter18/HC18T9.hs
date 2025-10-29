-- HC18T9: compositionLawCheck Function
compositionLawCheck :: (Eq (f c), Functor f) => (b -> c) -> (a -> b) -> f a -> Bool
compositionLawCheck f g x = fmap (f . g) x == (fmap f . fmap g) x

main :: IO ()
main = do
    putStrLn "HC18T9: compositionLawCheck"
    print (compositionLawCheck (*2) (+1) (Just 3))   -- True
    print (compositionLawCheck show (*3) [1,2,3])    -- True

