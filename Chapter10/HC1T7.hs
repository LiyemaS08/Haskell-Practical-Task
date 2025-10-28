-- HC1T7 - Task 7: Converting Fahrenheit to Celsius

fToC :: Floating a => a -> a
fToC f = (f - 32) * 5 / 9

main :: IO ()
main = do
  putStrLn "HC1T7 - fToC:"
  print (fToC 212)
  print (fToC 32)
