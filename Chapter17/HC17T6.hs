-- HC17T6: maxSeverity Function
data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
    (<>) = max

instance Monoid Severity where
    mempty = Low

maxSeverity :: [Severity] -> Severity
maxSeverity = mconcat

main :: IO ()
main = do
    putStrLn "HC17T6: maxSeverity"
    print (maxSeverity [Low, Medium, High])       -- High
    print (maxSeverity [Low, Critical, Medium])   -- Critical

