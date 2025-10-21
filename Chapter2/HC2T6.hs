smallNumber :: Int
smallNumber = 262

bigNumber :: Integer
bigNumber = 2127

main :: IO ()
main = do
    print smallNumber
    print bigNumber
    print ((2^64) :: Int)    -- Watch out for overflow here!
    print ((2^64) :: Integer) -- Correct large number
