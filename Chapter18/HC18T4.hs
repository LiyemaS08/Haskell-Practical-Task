-- HC18T4: mapToBits Function
mapToBits :: [Bool] -> [Char]
mapToBits = fmap (\b -> if b then '1' else '0')

main :: IO ()
main = do
    putStrLn "HC18T4: mapToBits"
    print (mapToBits [True, False, True, True])  -- "1011"

