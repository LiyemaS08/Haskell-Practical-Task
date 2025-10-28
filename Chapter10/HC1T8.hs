-- HC1T8 - Task 8: Higher-Order Functions

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = do
  putStrLn "HC1T8 - applyTwice:"
  print (applyTwice (*2) 3)
  print (applyTwice (++ "!") "Hi")
