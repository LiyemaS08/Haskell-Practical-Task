-- HC17T3: Monoid Instance for Severity
data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
    (<>) = max

instance Monoid Severity where
    mempty = Low

main :: IO ()
main = do
    putStrLn "HC17T3: Monoid for Severity"
    print (mconcat [Low, Medium, High, Critical]) -- Critical
    print (mempty <> High)                        -- High

