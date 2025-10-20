greaterThan18 :: (Ord a, Num a) => a -> Bool
greaterThan18 n = n > 18

main :: IO ()
main = do
    let testNumber = 20
    putStrLn ("Is " ++ show testNumber ++ " greater than 18? " ++ show (greaterThan18 testNumber))
