-- HC1T4 - Task 4: Composing a Function to Process Player Data

import Data.List (sortBy)
import Data.Ord (comparing)

extractPlayers :: [(String, Int)] -> [String]
extractPlayers players = [name | (name, _) <- players]

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip (comparing snd))

topThree :: [(String, Int)] -> [(String, Int)]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

main :: IO ()
main = do
  putStrLn "HC1T4 - getTopThreePlayers:"
  let players = [("Alice",90),("Bob",70),("Charlie",85),("Dave",95)]
  print (getTopThreePlayers players)
