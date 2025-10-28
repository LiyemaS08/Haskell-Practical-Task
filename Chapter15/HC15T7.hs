-- HC15T7 - Velocity Calculation with Optionals and Parsing Handling
import Text.Read (readMaybe)

main :: IO ()
main = do
    putStrLn "Enter distance (m):"
    dStr <- getLine
    putStrLn "Enter time (s):"
    tStr <- getLine
    case (readMaybe dStr, readMaybe tStr) of
        (Just d, Just t) ->
            if t == 0
                then putStrLn "Error: Time cannot be zero."
                else putStrLn ("Velocity = " ++ show (d / t) ++ " m/s")
        _ -> putStrLn "Invalid numeric input."

