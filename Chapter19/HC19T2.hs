-- HC19T2.hs

-- Function to add three Maybe Int values using applicative style
addThreeApplicative :: Maybe Int -> Maybe Int -> Maybe Int -> Maybe Int
addThreeApplicative mx my mz =
    pure (\x y z -> x + y + z) <*> mx <*> my <*> mz

-- Main function to test addThreeApplicative
main :: IO ()
main = do
    let a = Just 1
    let b = Just 2
    let c = Just 3
    let d = Nothing

    print $ addThreeApplicative a b c    -- Should print: Just 6
    print $ addThreeApplicative a b d    -- Should print: Nothing
