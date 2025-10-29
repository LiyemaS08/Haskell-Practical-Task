-- HC16T1: Reverse a String

reverseString :: String -> String
reverseString str = reverse str

main :: IO ()
main = do
    putStrLn (reverseString "Haskell")  -- Output: "lleksaH"
