-- HC17T9: Config Data Type and Semigroup Instance
data Config = Config
  { loggingLevel :: Int
  , timeout      :: Int
  , retries      :: Int
  } deriving (Show)

instance Semigroup Config where
    c1 <> c2 = Config
        { loggingLevel = max (loggingLevel c1) (loggingLevel c2)
        , timeout      = min (timeout c1) (timeout c2)
        , retries      = max (retries c1) (retries c2)
        }

main :: IO ()
main = do
    putStrLn "HC17T9: Config Semigroup"
    let c1 = Config 2 100 3
        c2 = Config 3 80 5
    print (c1 <> c2)

