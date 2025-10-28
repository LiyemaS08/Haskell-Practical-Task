-- HC14T8
import Data.List (group, sort)

counts :: String -> [(Char, Int)]
counts str = [(head g, length g) | g <- group (sort str)]

main :: IO ()
main = print (counts "haskell")

