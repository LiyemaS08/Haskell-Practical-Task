-- main.hs

import Control.Monad.State

type Position = (Int, Int)

-- Simple pseudo-random number generator
nextRand :: Int -> Int
nextRand x = (x * 1103515245 + 12345) `mod` 4

-- Move one step based on the pseudo-random number
step :: Position -> State Int Position
step (x, y) = do
    seed <- get
    let dir = nextRand seed
    put (seed + 1)  -- update seed
    let newPos = case dir of
            0 -> (x + 1, y)
            1 -> (x - 1, y)
            2 -> (x, y + 1)
            _ -> (x, y - 1)
    return newPos

-- Random walk of n steps starting from (0,0)
randomWalk :: Int -> State Int [Position]
randomWalk n = go n [(0,0)]
  where
    go 0 positions = return (reverse positions)
    go k positions = do
        nextPos <- step (head positions)
        go (k - 1) (nextPos : positions)

-- Main function
main :: IO ()
main = do
    let positions = evalState (randomWalk 10) 0
    putStrLn "Random Walk positions:"
    mapM_ print positions
