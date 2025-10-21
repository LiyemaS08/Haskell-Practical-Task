circleArea :: Float -> Float
circleArea r = pi * r * r

maxOfThree :: Int -> Int -> Int -> Int
maxOfThree x y z = max x (max y z)

main :: IO ()
main = do
    -- Testing circleArea
    print $ circleArea 3.0      -- ~28.274334
    print $ circleArea 5.5      -- ~95.03318

    -- Testing maxOfThree
    print $ maxOfThree 10 20 15 -- 20
    print $ maxOfThree 7 3 9    -- 9

