-- HC13T8 - Qualified Imports
import qualified Data.List as L
import qualified Data.Map as M

main :: IO ()
main = do
    let sorted = L.sort [3,1,2]
    let myMap = M.fromList [(1,"One"), (2,"Two")]
    print sorted
    print (M.lookup 2 myMap)

