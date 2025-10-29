-- HC18T6: applyToMaybe Function
applyToMaybe :: (a -> b) -> Maybe a -> Maybe b
applyToMaybe f = fmap f

main :: IO ()
main = do
    putStrLn "HC18T6: applyToMaybe"
    print (applyToMaybe (*2) (Just 10))  -- Just 20
    print (applyToMaybe (*2) Nothing)    -- Nothing

