-- Immutable variable definitions
myAge :: Int
myAge = 25

piValue :: Double
piValue = 3.14159

greeting :: String
greeting = "Hello, Haskell!"

isHaskellFun :: Bool
isHaskellFun = True

-- Main function to print the values
main :: IO ()
main = do
    print myAge
    print piValue
    print greeting
    print isHaskellFun
