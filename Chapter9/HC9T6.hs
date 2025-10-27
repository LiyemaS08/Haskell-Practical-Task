-- HC9T6.hs
data Tweet = Tweet
  { content :: String
  , likes :: Int
  , comments :: [Tweet]
  } deriving (Show)

main :: IO ()
main = do
    let reply = Tweet "Nice post!" 2 []
    let post = Tweet "Hello world!" 10 [reply]
    print post

