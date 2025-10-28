-- HC15T5 - Safe Division Using Maybe
safeDivide :: Double -> Double -> Maybe Double
safeDivide _ 0 = Nothing
safeDivide x y = Just (x / y)

main :: IO ()
main = do
    let result = safeDivide 10 0
    case result of
        Nothing -> putStrLn "Cannot divide by zero."
        Just v  -> putStrLn ("Result: " ++ show v)

