-- HC15T4 - Exception Handler for Traffic Light
import Control.Exception

data TrafficLightError = InvalidLight String deriving (Show)
instance Exception TrafficLightError

main :: IO ()
main = handle handler $ do
    putStrLn "Enter traffic light color:"
    color <- getLine
    if color `elem` ["red","yellow","green"]
       then putStrLn ("Valid color: " ++ color)
       else throwIO (InvalidLight color)
  where
    handler :: TrafficLightError -> IO ()
    handler (InvalidLight c) = putStrLn ("Error: '" ++ c ++ "' is not a valid traffic light color.")

