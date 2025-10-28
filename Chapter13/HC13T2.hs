-- HC13T2 - Filter Files by Substring
import System.Directory
import Data.List (isInfixOf)

main :: IO ()
main = do
    putStrLn "Enter a substring to filter filenames:"
    keyword <- getLine
    files <- listDirectory "."
    let matched = filter (isInfixOf keyword) files
    putStrLn "Matching files:"
    mapM_ putStrLn matched

