-- HC20T16.hs

import Control.Exception (try, SomeException)

-- retryIO: retries an IO action up to n times
retryIO :: Int -> IO a -> IO (Maybe a)
retryIO 0 _ = return Nothing  -- no attempts left
retryIO n action = do
    result <- try action  -- catch any exception
    case result of
        Right val -> return (Just val)  -- success
        Left (_ :: SomeException) -> retryIO (n - 1) action  -- retry

-- Example usage
main :: IO ()
main = do
    putStrLn "Trying to read a file (example)..."
    res <- retryIO 3 (readFile "nonexistent.txt")  -- replace with any IO action
    case res of
        Just content -> putStrLn $ "Success! Content length: " ++ show (length content)
        Nothing      -> putStrLn "Failed after 3 attempts."
