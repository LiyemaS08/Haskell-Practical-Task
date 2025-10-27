-- HC7T7.hs
data Color = Red | Green | Blue
    deriving (Show, Eq, Enum, Bounded)

nextColor :: Color -> Color
nextColor c
    | c == maxBound = minBound
    | otherwise     = succ c

main :: IO ()
main = do
    print (nextColor Red)   -- Green
    print (nextColor Blue)  -- Red

