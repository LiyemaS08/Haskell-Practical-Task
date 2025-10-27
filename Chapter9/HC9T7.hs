-- HC9T7.hs
data Tweet = Tweet
  { content :: String
  , likes :: Int
  , comments :: [Tweet]
  } deriving (Show)

engagement :: Tweet -> Int
engagement (Tweet _ likes comments) =
    likes + sum (map engagement comments)

main :: IO ()
main = do
    let c1 = Tweet "Nice!" 3 []
    let c2 = Tweet "Cool!" 5 []
    let post = Tweet "My first tweet!" 10 [c1, c2]
    print (engagement post)  -- 18

