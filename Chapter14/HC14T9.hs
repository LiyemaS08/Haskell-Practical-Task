{-# LANGUAGE PartialTypeSignatures #-}

-- HC14T9
add :: Num a => a -> a -> _
add x y = x + y

main :: IO ()
main = print (add 5 7)

