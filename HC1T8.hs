applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main :: IO ()
main = do
    print $ applyTwice (+3) 10           -- Output: 16
    print $ applyTwice (++ "ha") "Hey"  -- Output: "Heyhaha"
