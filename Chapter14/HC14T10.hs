import Test.HUnit
import Counts

main :: IO ()
main = do
    let test1 = TestCase (assertEqual "Count test" [('a',2)] (counts "aa"))
    _ <- runTestTT (TestList [test1])
    return ()

