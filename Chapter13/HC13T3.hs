-- HC13T3 - Sort and Return Filtered Files
import System.Directory
import Data.List (sort, isInfixOf)

main :: IO ()
main = do
    putStrLn "Enter substring to filter:"
    keyword <- getLine
    files <- listDirectory "."
    let filtered = filter (isInfixOf keyword) files
    putStrLn "Sorted filtered files:"
    mapM_ putStrLn (sort filtered)

