triangleType :: Float -> Float -> Float -> String
triangleType a b c
    | a == b && b == c           = "Equilateral"
    | a == b || b == c || a == c = "Isosceles"
    | otherwise                  = "Scalene"

main :: IO ()
main = do
    print (triangleType 3 3 3)  -- "Equilateral"
    print (triangleType 5 5 8)  -- "Isosceles"
    print (triangleType 6 7 8)  -- "Scalene"

