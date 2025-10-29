module Main where
import qualified Data.Map as M

type Env = M.Map String String

-- Explicit version
getPortExplicit :: Env -> String
getPortExplicit env = "Port=" ++ M.findWithDefault "Unknown" "DB_PORT" env

-- Reader abstraction
newtype Reader r a = Reader { runReader :: r -> a }

instance Functor (Reader r) where
  fmap f (Reader g) = Reader (f . g)
instance Applicative (Reader r) where
  pure a = Reader (\_ -> a)
  Reader f <*> Reader g = Reader (\r -> f r (g r))
instance Monad (Reader r) where
  return = pure
  Reader g >>= f = Reader (\r -> runReader (f (g r)) r)

ask :: Reader r r
ask = Reader id

local :: (r -> r) -> Reader r a -> Reader r a
local f (Reader g) = Reader (g . f)

getPort :: Reader Env String
getPort = do
  env <- ask
  return ("Port=" ++ M.findWithDefault "Unknown" "DB_PORT" env)

main :: IO ()
main = do
  let baseEnv = M.fromList [("DB_PORT","5432"),("DB_HOST","localhost")]
  putStrLn (runReader getPort baseEnv)
  putStrLn (runReader (local (M.insert "DB_PORT" "9999") getPort) baseEnv)

