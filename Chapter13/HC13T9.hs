-- HC13T9 - Renaming Module Namespace
import qualified Data.List as ListModule
import qualified Data.Char as C

main :: IO ()
main = do
    let word = "Haskell"
    print (ListModule.sort word)
    print (map C.toUpper word)

