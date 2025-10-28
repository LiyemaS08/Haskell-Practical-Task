-- HC15T3 - Custom Exception for Traffic Light Errors
import Control.Exception

data TrafficLightError = InvalidLight String
    deriving (Show)

instance Exception TrafficLightError

checkLight :: String -> IO ()
checkLight color
    | color `elem` ["red", "yellow", "green"] = putStrLn "Light recognized."
    | otherwise = throwIO (InvalidLight ("Invalid color: " ++ color))

main :: IO ()
main = do
    putStrLn "Enter traffic light color:"
    color <- getLine
    checkLight color
