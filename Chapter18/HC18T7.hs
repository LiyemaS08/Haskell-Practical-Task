-- HC18T7: fmapTuple Function
fmapTuple :: (b -> c) -> (a, b) -> (a, c)
fmapTuple = fmap

main :: IO ()
main = do
    putStrLn "HC18T7: fmapTuple"
    print (fmapTuple length ("Count", "Hello"))  -- ("Count",5)

