season :: Int -> String
season month
    | month == 12 || month == 1 || month == 2  = "Winter"
    | month >= 3 && month <= 5                 = "Spring"
    | month >= 6 && month <= 8                 = "Summer"
    | month >= 9 && month <= 11                = "Autumn"
    | otherwise                                = "Invalid month"

main :: IO ()
main = do
    print (season 3)   -- "Spring"
    print (season 7)   -- "Summer"
    print (season 11)  -- "Autumn"

