-- HC18T1: mapToLower Function with fmap
import Data.Char (toLower)

mapToLower :: String -> String
mapToLower = fmap toLower

main :: IO ()
main = do
    putStrLn "HC18T1: mapToLower"
    print (mapToLower "HASKELL")  -- "haskell"

