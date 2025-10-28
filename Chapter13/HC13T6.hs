-- HC13T6 - File Names to Map
import System.Directory
import qualified Data.Map as Map

main :: IO ()
main = do
    files <- listDirectory "."
    let fileMap = Map.fromList (zip [1..] files)
    print fileMap

