-- HC16T10: Character Frequency in String
import Data.List (nub)

charFrequency :: String -> [(Char, Int)]
charFrequency str = [(c, count c str) | c <- nub str]
  where
    count ch xs = length (filter (== ch) xs)

main :: IO ()
main = do
    putStrLn "HC16T10: Character Frequency in String"
    print (charFrequency "haskell")

