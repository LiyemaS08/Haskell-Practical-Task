module Main where

newtype Reader r a = Reader { runReader :: r -> a }

ask :: Reader r r
ask = Reader id

local :: (r -> r) -> Reader r a -> Reader r a
local f (Reader ra) = Reader (ra . f)

data Config = Config { greetPrefix :: String, shout :: Bool }

greet :: String -> Reader Config String
greet name = do
  cfg <- ask
  let base = greetPrefix cfg ++ ", " ++ name
  return (if shout cfg then map toUpper base else base)
  where toUpper c | 'a'<=c && c<='z' = toEnum (fromEnum c - 32)
                  | otherwise = c

main :: IO ()
main = do
  let cfg = Config "Hello" False
      cfgLoud = Config "HEY" True
  print (runReader (greet "Alice") cfg)
  print (runReader (local (\_ -> cfgLoud) (greet "Bob")) cfg)
