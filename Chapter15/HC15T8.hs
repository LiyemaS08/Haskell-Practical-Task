-- HC15T8 - Division with Either for Detailed Errors
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Cannot divide by zero."
safeDivide x y = Right (x / y)

main :: IO ()
main = do
    let res = safeDivide 10 0
    case res of
        Left err -> putStrLn ("Error: " ++ err)
        Right val -> putStrLn ("Result: " ++ show val)

