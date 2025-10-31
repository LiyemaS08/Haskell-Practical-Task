-- Main.hs

-- sumNonEmpty function (replaces external module)
sumNonEmpty :: Num a => [a] -> a
sumNonEmpty [] = error "sumNonEmpty: empty list"
sumNonEmpty xs = sum xs

main :: IO ()
main = do
    let numbers = [5, 10, 15]
    putStrLn $ "The sum of the list is: " ++ show (sumNonEmpty numbers)
