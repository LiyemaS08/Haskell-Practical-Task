import Data.List (sortBy)
import Data.Ord (comparing)

extractPlayers :: [(String, Int)] -> [String]
extractPlayers players = map fst players

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip (comparing snd))

topThree :: [(String, Int)] -> [(String, Int)]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

main :: IO ()
main = do
    let players = [("Alice", 50), ("Bob", 75), ("Charlie", 40), ("Diana", 90), ("Eve", 60)]
    print $ getTopThreePlayers players
    -- Output: ["Diana","Bob","Eve"]
