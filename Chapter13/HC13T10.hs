-- HC13T10 - Multi-Module Main Function
import System.Directory
import Data.List (sort, isInfixOf)

main :: IO ()
main = do
    putStrLn "Enter a keyword to search for files:"
    key <- getLine
    files <- listDirectory "."
    let results = sort (filter (isInfixOf key) files)
    mapM_ putStrLn results

