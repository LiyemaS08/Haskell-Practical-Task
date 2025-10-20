circleArea :: Floating a => a -> a
circleArea radius = pi * radius ^ 2

main :: IO ()
main = do
    let radius = 3
    let area = circleArea radius
    putStrLn ("The area of a circle with radius " ++ show radius ++ " is " ++ show area)
