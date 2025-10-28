-- HC15T1 - Handle Exceptions for File Reading and Velocity Calculation
import Control.Exception
import System.IO

main :: IO ()
main = do
    putStrLn "Enter file name:"
    fname <- getLine
    content <- try (readFile fname) :: IO (Either IOError String)
    case content of
        Left _ -> putStrLn "Error: Could not read file."
        Right text -> do
            putStrLn "File read successfully."
            putStrLn "Enter distance (m):"
            dStr <- getLine
            putStrLn "Enter time (s):"
            tStr <- getLine
            let distance = read dStr :: Double
                time = read tStr :: Double
            if time == 0
                then putStrLn "Error: Division by zero."
                else putStrLn ("Velocity = " ++ show (distance / time) ++ " m/s")
