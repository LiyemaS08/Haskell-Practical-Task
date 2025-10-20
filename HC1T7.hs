-- Define the function
fToC :: Floating a => a -> a
fToC f = (f - 32) * 5 / 9

-- Use it in main
main :: IO ()
main = do
    print $ fToC 212   -- Should print 100.0
    print $ fToC 32    -- Should print 0.0
