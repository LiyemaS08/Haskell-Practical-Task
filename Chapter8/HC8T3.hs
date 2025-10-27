-- HC8T3.hs
data Shape = Circle Float | Rectangle Float Float deriving (Show)

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h

main :: IO ()
main = do
    print (area (Circle 5))        -- 78.53982
    print (area (Rectangle 10 5))  -- 50.0
