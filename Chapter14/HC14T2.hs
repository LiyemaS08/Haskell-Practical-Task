-- Main.hs

-- Import must be at the top
import Data.Time.Clock.POSIX (getPOSIXTime)

main :: IO ()
main = do
    -- Fake a random number between 1 and 100
    fakeRandom <- getFakeRandom
    putStrLn $ "Random number: " ++ show fakeRandom

-- Helper function to generate a pseudo-random number
getFakeRandom :: IO Int
getFakeRandom = do
    -- Use system time to simulate randomness
    time <- fmap round getPOSIXTime
    let num = (time `mod` 100) + 1
    return num
