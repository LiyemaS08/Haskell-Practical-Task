-- infiniteNumbers: infinite list of natural numbers starting from 1
infiniteNumbers :: [Integer]
infiniteNumbers = [1..]

-- takeN: take first n elements from infiniteNumbers
takeN :: Int -> [Integer]
takeN n = take n infiniteNumbers

main :: IO ()
main = do
    print $ takeN 10
    -- Output: [1,2,3,4,5,6,7,8,9,10]

