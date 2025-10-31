-- main.hs

import Data.Char (toUpper)

-- Simple Reader type
newtype Reader r a = Reader { runReader :: r -> a }

-- Functor instance
instance Functor (Reader r) where
    fmap f (Reader g) = Reader (\r -> f (g r))

-- Applicative instance
instance Applicative (Reader r) where
    pure x = Reader (\_ -> x)
    Reader f <*> Reader x = Reader (\r -> f r (x r))

-- Monad instance
instance Monad (Reader r) where
    Reader x >>= f = Reader (\r -> runReader (f (x r)) r)

-- Ask: get the environment
ask :: Reader r r
ask = Reader id

-- Local: modify the environment for a sub-computation
local :: (r -> r) -> Reader r a -> Reader r a
local f (Reader g) = Reader (\r -> g (f r))

-- Config type
data Config = Config { greetPrefix :: String, shout :: Bool }

-- Greeting function
greet :: String -> Reader Config String
greet name = do
    cfg <- ask
    let base = greetPrefix cfg ++ ", " ++ name
    if shout cfg
        then return (map toUpper base)
        else do
            -- Example: sub-call with shout flipped
            local (\c -> c { shout = not (shout c) }) $ do
                cfg2 <- ask
                let subBase = greetPrefix cfg2 ++ ", " ++ name ++ " (sub-call)"
                return subBase

-- Main to test
main :: IO ()
main = do
    let cfg1 = Config { greetPrefix = "Hello", shout = False }
    let cfg2 = Config { greetPrefix = "Hi", shout = True }
    
    putStrLn $ runReader (greet "Alice") cfg1
    putStrLn $ runReader (greet "Bob") cfg2
