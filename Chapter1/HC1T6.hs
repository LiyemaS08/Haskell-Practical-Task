-- Function definition
addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

-- Main function to run the program
main :: IO ()
main = do
  let result = addNumbers 3 5
  print result
