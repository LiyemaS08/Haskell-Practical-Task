-- Main.hs

-- Define the Color data type
data Color = Red | Green | Blue
    deriving (Show)  -- So we can print them nicely

-- Implement Eq manually
instance Eq Color where
    Red   == Red   = True
    Green == Green = True
    Blue  == Blue  = True
    _     == _     = False

-- Main program
main :: IO ()
main = do
    print (Red == Red)      -- True
    print (Red == Blue)     -- False
    print (Green == Green)  -- True
