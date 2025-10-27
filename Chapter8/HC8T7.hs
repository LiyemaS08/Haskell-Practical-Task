-- HC8T7.hs
data Animal = Dog String | Cat String deriving (Show)

describeAnimal :: Animal -> String
describeAnimal (Dog name) = "This is a dog named " ++ name
describeAnimal (Cat name) = "This is a cat named " ++ name

main :: IO ()
main = do
    let dog1 = Dog "Buddy"
    let cat1 = Cat "Whiskers"
    putStrLn (describeAnimal dog1)
    putStrLn (describeAnimal cat1)
v
