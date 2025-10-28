-- HC13T1 - List Files in Directory
import System.Directory

main :: IO ()
main = do
    putStrLn "Files in current directory:"
    files <- listDirectory "."
    mapM_ putStrLn files

