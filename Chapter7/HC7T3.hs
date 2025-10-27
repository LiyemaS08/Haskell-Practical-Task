-- HC7T3.hs
compareValues :: (Eq a, Ord a) => a -> a -> a
compareValues x y = if x >= y then x else y

main :: IO ()
main = do
    print (compareValues 5 10)   -- 10
    print (compareValues 'a' 'z')-- 'z'
