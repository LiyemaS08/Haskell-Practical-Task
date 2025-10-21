-- Main.hs
main :: IO ()
main = do
    print (42 :: Int)
    print (3.14 :: Double)
    print ("Haskell" :: String)
    print ('Z' :: Char)
    print (True && False)
