-- Main.hs

-- Library-style functions
double :: Num a => a -> a
double x = x * 2

triple :: Num a => a -> a
triple x = x * 3

main :: IO ()
main = do
    putStrLn ("Double 5 = " ++ show (double 5))
    putStrLn ("Triple 5 = " ++ show (triple 5))
