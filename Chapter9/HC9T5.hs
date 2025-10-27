-- HC9T5.hs
data Shape a
  = Circle { color :: a, radius :: Float }
  | Rectangle { color :: a, width :: Float, height :: Float }
  deriving (Show)

main :: IO ()
main = do
    let s1 = Circle { color = "Red", radius = 5.0 }
    let s2 = Rectangle { color = "Blue", width = 10.0, height = 4.0 }
    print s1
    print s2

