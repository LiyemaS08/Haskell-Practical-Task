-- HC12T7
calculateCircleArea :: Floating a => a -> a
calculateCircleArea r = pi * r^2

main :: IO ()
main = print (calculateCircleArea 5)
