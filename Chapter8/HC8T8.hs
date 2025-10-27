-- HC8T8.hs
type Name = String
type Age = Int

greet :: Name -> Age -> String
greet name age = "Hello, " ++ name ++ "! You are " ++ show age ++ " years old."

main :: IO ()
main = putStrLn (greet "Amahle" 25)

