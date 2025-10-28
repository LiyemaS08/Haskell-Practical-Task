-- HC15T10 - Hybrid Error Handling with Either and IO
import Control.Exception
import Text.Read (readMaybe)

safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Cannot divide by zero."
safeDivide x y = Right (x / y)

main :: IO ()
main = do
    putStrLn "Enter distance (m):"
    dStr <- getLine
    putStrLn "Enter time (s):"
    tStr <- getLine
    case (readMaybe dStr, readMaybe tStr) of
        (Just d, Just t) -> do
            case safeDivide d t of
                Left err -> putStrLn ("Error: " ++ err)
                Right v  -> putStrLn ("Velocity = " ++ show v ++ " m/s")
        _ -> putStrLn "Invalid numeric input."

