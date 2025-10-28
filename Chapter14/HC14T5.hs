-- HC14T5
data Result a = Success a | Failure String

process :: Result Int -> String
process r@(Success x) = "Success: " ++ show x ++ " (full pattern: " ++ show r ++ ")"
process (Failure msg) = "Failure: " ++ msg

main :: IO ()
main = do
    print (process (Success 10))
    print (process (Failure "Something went wrong"))

