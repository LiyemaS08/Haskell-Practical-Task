-- HC9T2.hs
data Box a = Empty | Has a deriving (Show)

main :: IO ()
main = do
    let b1 :: Box Int  -- specify the type explicitly
        b1 = Empty

    let b2 = Has 10

    print b1
    print b2

