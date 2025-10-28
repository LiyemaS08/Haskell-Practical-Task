-- HC15T2 - Self-Driving AI Car System
main :: IO ()
main = do
    putStrLn "Traffic light color (red/yellow/green):"
    color <- getLine
    putStrLn (carAction color)

carAction :: String -> String
carAction "red"    = "Stop immediately!"
carAction "yellow" = "Prepare to stop."
carAction "green"  = "Go ahead."
carAction _        = "Unknown signal!"
