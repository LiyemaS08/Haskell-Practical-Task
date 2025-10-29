-- HC16T2: Palindrome Checker
isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

main :: IO ()
main = do
    putStrLn "HC16T2: Palindrome Checker"
    print (isPalindrome "madam")
    print (isPalindrome "hello")

