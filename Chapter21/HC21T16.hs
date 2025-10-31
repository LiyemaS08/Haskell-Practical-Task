-- main.hs

-- Writer
data Writer a = Writer a [String]
  deriving (Show, Eq)

instance Functor Writer where
    fmap f (Writer x log) = Writer (f x) log

instance Applicative Writer where
    pure x = Writer x []
    (Writer f log1) <*> (Writer x log2) = Writer (f x) (log1 ++ log2)

instance Monad Writer where
    (Writer x log1) >>= f =
        let (Writer y log2) = f x
        in Writer y (log1 ++ log2)

-- Helper
tell :: String -> Writer ()
tell log = Writer () [log]

-- Writer associativity test
writerTest :: Bool
writerTest =
    let m = Writer 3 ["start"]
        k x = Writer (x+1) ["k"]
        h x = Writer (x*2) ["h"]
    in ((m >>= k) >>= h) == (m >>= (\x -> k x >>= h))

-- Reader
newtype Reader r a = Reader { runReader :: r -> a }

instance Functor (Reader r) where
    fmap f (Reader g) = Reader (\r -> f (g r))

instance Applicative (Reader r) where
    pure x = Reader (\_ -> x)
    Reader f <*> Reader x = Reader (\r -> f r (x r))

instance Monad (Reader r) where
    Reader x >>= f = Reader (\r -> runReader (f (x r)) r)

ask :: Reader r r
ask = Reader id

local :: (r -> r) -> Reader r a -> Reader r a
local f (Reader g) = Reader (\r -> g (f r))

-- Config
data Config = Config { greetPrefix :: String, shout :: Bool }
  deriving Show  -- only Show, not Eq

-- Reader identity test
readerTest1 :: Config -> IO ()
readerTest1 cfg = do
    let res1 = runReader (local id ask) cfg
        res2 = runReader ask cfg
    putStrLn $ "local id result: " ++ show res1
    putStrLn $ "ask result: " ++ show res2

-- Reader local/ask law
readerTest2 :: Config -> IO ()
readerTest2 cfg = do
    let f (Config p s) = Config (p ++ "!") s
        k r = Reader (\_ -> greetPrefix r ++ " called")
        res1 = runReader (local f (ask >>= k)) cfg
        res2 = runReader (ask >>= (\r -> local f (k r))) cfg
    putStrLn $ "local f (ask >>= k) result: " ++ show res1
    putStrLn $ "ask >>= (\\r -> local f (k r)) result: " ++ show res2

-- Main
main :: IO ()
main = do
    putStrLn "Writer associativity test:"
    print writerTest

    let cfg = Config "Hello" False
    putStrLn "\nReader local id == identity test:"
    readerTest1 cfg
    putStrLn "\nReader local f (ask >>= k) == ask >>= (\\r -> local f (k r)) test:"
    readerTest2 cfg

    putStrLn "\nExplanations:"
    putStrLn "- Writer associativity: grouping of >>= doesn’t change logs."
    putStrLn "- Reader local/ask: local id does nothing; local f distributes over ask >>= k."
