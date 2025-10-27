-- HC8T4.hs
data Employee = Employee
  { name :: String
  , experienceInYears :: Float
  } deriving (Show)

richard :: Employee
richard = Employee { name = "Richard", experienceInYears = 7.5 }

main :: IO ()
main = print richard
