maxOfThree :: Int -> Int -> Int -> Int
maxOfThree x y z =
    let maxXY = if x > y then x else y
        maxXYZ = if maxXY > z then maxXY else z
    in maxXYZ

main :: IO ()
main = do
    print (maxOfThree 10 20 15)  -- 20
    print (maxOfThree 5 25 10)   -- 25

