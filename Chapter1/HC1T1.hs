import Data.List (sortBy)

-- HC1T1 - Task 1: Function Composition
double :: Int -> Int
double x = x * 2

increment :: Int -> Int
increment x = x + 1

doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double

-- HC1T2 - Task 2: Pure Function Example
circleArea :: Floating a => a -> a
circleArea r = pi * r * r

-- HC1T3 - Task 3: Checking if a Number is Greater than 18
greaterThan18 :: Int -> Bool
greaterThan18 x = x > 18

-- HC1T4 - Task 4: Composing a Function to Process Player Data
extractPlayers :: [(String, Int)] -> [String]
extractPlayers players = map fst players

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore players = reverse (sortBy (\(_, s1) (_, s2) -> compare s1 s2) players)

topThree :: [(String, Int)] -> [(String, Int)]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

-- HC1T5 - Task 5: Laziness in Haskell
infiniteNumbers :: [Int]
infiniteNumbers = [1..]

firstN :: Int -> [Int]
firstN n = take n infiniteNumbers

-- HC1T6 - Task 6: Using Type Signatures
addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

-- HC1T7 - Task 7: Converting Fahrenheit to Celsius
fToC :: Floating a => a -> a
fToC f = (f - 32) * 5 / 9

-- HC1T8 - Task 8: Higher-Order Functions
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- Main function to demonstrate all tasks
main :: IO ()
main = do
    putStrLn "HC1T1 - doubleThenIncrement of 4:"
    print (doubleThenIncrement 4)  -- Expected: (4*2) + 1 = 9

    putStrLn "\nHC1T2 - Area of circle with radius 5:"
    print (circleArea 5)  -- Expected: 78.53981633974483

    putStrLn "\nHC1T3 - Is 20 greater than 18?"
    print (greaterThan18 20)  -- Expected: True

    putStrLn "\nHC1T4 - Top 3 players:"
    let players = [("Alice", 25), ("Bob", 50), ("Eve", 40), ("Charlie", 35)]
    print (getTopThreePlayers players)  -- Expected: ["Bob", "Eve", "Charlie"]

    putStrLn "\nHC1T5 - First 10 numbers from infinite list:"
    print (firstN 10)  -- Expected: [1,2,3,4,5,6,7,8,9,10]

    putStrLn "\nHC1T6 - Adding 7 and 3:"
    print (addNumbers 7 3)  -- Expected: 10

    putStrLn "\nHC1T7 - 100°F in Celsius:"
    print (fToC 100)  -- Expected: 37.777...

    putStrLn "\nHC1T8 - Apply 'double' twice to 3:"
    print (applyTwice double 3)  -- Expected: double(double(3)) = 12
