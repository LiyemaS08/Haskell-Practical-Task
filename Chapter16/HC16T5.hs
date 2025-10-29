-- HC16T5: Uppercase String
import Data.Char (toUpper)

toUpperCase :: String -> String
toUpperCase str = map toUpper str

main :: IO ()
main = do
    putStrLn "HC16T5: Uppercase String"
    print (toUpperCase "functional programming")

