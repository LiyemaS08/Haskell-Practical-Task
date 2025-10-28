-- HC1T2 - Task 2: Pure Function Example

circleArea :: Floating a => a -> a
circleArea radius = pi * radius ^ 2

main :: IO ()
main = do
  putStrLn "HC1T2 - circleArea:"
  print (circleArea 5)
  print (circleArea 10)
