-- Main.hs

checkNumber :: Int -> String
checkNumber n = 
    if n > 0 then "Positive"
    else if n < 0 then "Negative"
    else "Zero"

main :: IO ()
main = do
    print (checkNumber 5)    -- Should print "Positive"
    print (checkNumber (-3)) -- Should print "Negative"
    print (checkNumber 0)    -- Should print "Zero"

