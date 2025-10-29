-- HC18T8: identityLawCheck Function
identityLawCheck :: (Eq (f a), Functor f) => f a -> Bool
identityLawCheck x = fmap id x == x

main :: IO ()
main = do
    putStrLn "HC18T8: identityLawCheck"
    print (identityLawCheck (Just 5))        -- True
    print (identityLawCheck [1,2,3])         -- True

