-- HC1T6 - Task 6: Using Type Signatures

addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

main :: IO ()
main = do
  putStrLn "HC1T6 - addNumbers:"
  print (addNumbers 7 8)
  print (addNumbers 12 5)
