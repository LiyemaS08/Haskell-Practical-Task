-- HC9T1.hs
type Entity a = (String, a)  -- e.g. (Address, some entity type)

main :: IO ()
main = do
    let userEntity :: Entity Int
        userEntity = ("123 Blockchain Lane", 42)
    print userEntity
