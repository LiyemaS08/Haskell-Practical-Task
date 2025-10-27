-- HC7T5.hs
squareArea :: Num a => a -> a
squareArea side = side * side

main :: IO ()
main = print (squareArea 4)  -- 16

