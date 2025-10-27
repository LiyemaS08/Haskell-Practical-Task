-- HC7T8.hs
data Shape = Circle Double | Rectangle Double Double
    deriving (Show, Read, Eq)

parseShape :: String -> Maybe Shape
parseShape s = case reads s of
    [(sh, "")] -> Just sh
    _          -> Nothing

main :: IO ()
main = do
    print (parseShape "Circle 5")       -- Just (Circle 5.0)
    print (parseShape "Rectangle 3 4")  -- Just (Rectangle 3.0 4.0)
    print (parseShape "Unknown 5")      -- Nothing

