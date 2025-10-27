-- HC8T2.hs
data PaymentMethod = Cash | Card | Cryptocurrency deriving (Show)

data Person = Person String (String, Int) PaymentMethod deriving (Show)

bob :: Person
bob = Person "Bob" ("Baker Street", 221) Cash

main :: IO ()
main = print bob
