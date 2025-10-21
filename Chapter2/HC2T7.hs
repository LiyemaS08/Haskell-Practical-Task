main :: IO ()
main = do
    print (True && True)     -- True
    print (False || False)   -- False
    print (not False)        -- True
    print (5 > 10)           -- False
