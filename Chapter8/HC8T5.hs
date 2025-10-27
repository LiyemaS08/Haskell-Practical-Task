-- HC8T5.hs
data Person = Person
  { name :: String
  , age :: Int
  , isEmployed :: Bool
  } deriving (Show)

person1 :: Person
person1 = Person { name = "Tumelo", age = 30, isEmployed = True }

person2 :: Person
person2 = Person { name = "Tshepo", age = 25, isEmployed = False }

main :: IO ()
main = do
    print person1
    print person2
