-- HC8T6.hs
data Shape
  = Circle { center :: (Float, Float), color :: String, radius :: Float }
  | Rectangle { width :: Float, height :: Float, color :: String }
  deriving (Show)

circle1 :: Shape
circle1 = Circle { center = (0, 0), color = "Red", radius = 5.0 }

rectangle1 :: Shape
rectangle1 = Rectangle { width = 10, height = 5, color = "Blue" }

main :: IO ()
main = do
    print circle1
    print rectangle1
