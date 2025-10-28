{-# LANGUAGE TypeApplications #-}

-- HC14T4
main :: IO ()
main = do
    let str = "42"
    let num = read @Int str
    print num

