-- HC8T10.hs
data Book = Book
  { title :: String
  , author :: String
  , year :: Int
  } deriving (Show)

book1 :: Book
book1 = Book { title = "Learn You a Haskell", author = "Miran Lipovaca", year = 2011 }

main :: IO ()
main = print book1
