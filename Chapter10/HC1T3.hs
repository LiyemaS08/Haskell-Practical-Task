-- HC1T3 - Task 3: Checking if a Number is Greater than 18

greaterThan18 :: Int -> Bool
greaterThan18 x = x > 18

main :: IO ()
main = do
  putStrLn "HC1T3 - greaterThan18:"
  print (greaterThan18 20)
  print (greaterThan18 15)
