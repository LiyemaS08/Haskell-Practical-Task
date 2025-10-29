-- HC17T1: Severity Data Type and Semigroup Instance
data Severity = Low | Medium | High | Critical
  deriving (Show, Eq, Ord)

instance Semigroup Severity where
    (<>) = max  -- Higher severity overrides lower one

main :: IO ()
main = do
    putStrLn "HC17T1: Severity Semigroup"
    print (Low <> High)       -- High
    print (Medium <> Critical) -- Critical
    print (High <> Medium)    -- High
