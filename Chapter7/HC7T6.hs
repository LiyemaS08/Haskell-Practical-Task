-- HC7T6.hs
circleCircumference :: (Floating a, Real a) => a -> a
circleCircumference r = 2 * pi * r

main :: IO ()
main = print (circleCircumference 3)  -- 18.84955592153876

