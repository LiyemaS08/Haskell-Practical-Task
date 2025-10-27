-- HC7T4.hs
data Shape = Circle Double | Rectangle Double Double
    deriving (Eq)

instance Show Shape where
    show (Circle r) = "Circle " ++ show r
    show (Rectangle w h) = "Rectangle " ++ show w ++ " " ++ show h

instance Read Shape where
    readsPrec _ str =
        case words str of
            ["Circle", r] -> [(Circle (read r), "")]
            ["Rectangle", w, h] -> [(Rectangle (read w) (read h), "")]
            _ -> []

main :: IO ()
main = do
    let s1 = Circle 5
    print s1
    print (read "Rectangle 3 4" :: Shape)
