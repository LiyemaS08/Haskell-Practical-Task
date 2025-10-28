-- HC12T5
isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

main :: IO ()
main = do
    putStrLn "Enter a word:"
    word <- getLine
    putStrLn (if isPalindrome word then "Palindrome!" else "Not a palindrome.")
