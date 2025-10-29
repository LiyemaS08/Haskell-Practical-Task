module Main where

validatePassword :: String -> Either String String
validatePassword pwd
  | length pwd < 8 = Left "Password too short"
  | not (any (`elem` ['0'..'9']) pwd) = Left "Must include a digit"
  | otherwise = Right "Password valid"

main :: IO ()
main = do
  print (validatePassword "abc")
  print (validatePassword "pass1234")

