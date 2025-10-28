-- HC1T5 - Task 5: Laziness in Haskell

infiniteNumbers :: [Int]
infiniteNumbers = [1..]

firstN :: Int -> [Int]
firstN n = take n infiniteNumbers

main :: IO ()
main = do
  putStrLn "HC1T5 - firstN (from infinite list):"
  print (firstN 10)
