module Main where

retryIO :: Int -> IO a -> IO (Maybe a)
retryIO 0 _ = return Nothing
retryIO n action = do
  result <- (Just <$> action) `catch` (\(_ :: IOError) -> return Nothing)
  case result of
    Just v  -> return (Just v)
    Nothing -> retryIO (n - 1) action

import Control.Exception (catch, IOException)

main :: IO ()
main = do
  res <- retryIO 3 (readFile "missing.txt")
  print (fmap (take 20) res)

