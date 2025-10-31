-- main.hs

import Control.Monad.State

type Position = (Int, Int)
type RNGState = (Int, Position)  -- (seed, position)

-- Simple pseudo-random number generator: linear congruential generator
nextSeed :: Int -> Int
nextSeed s = (s * 1103515245 + 12345) `mod` 2147483648

-- Take a number mod 4 to choose direction
directionFromSeed :: Int -> (Int, Int)
directionFromSeed s = case s `mod` 4 of
    0 -> (0, 1)   -- Up
    1 -> (0, -1)  -- Down
    2 -> (-1, 0)  -- Left
    _ -> (1, 0)   -- Right

-- Random step: update seed and move position
randomStep :: State RNGState ()
randomStep = do
    (seed, pos) <- get
    let newSeed = nextSeed seed
        move = directionFromSeed newSeed
        newPos = (fst pos + fst move, snd pos + snd move)
    put (newSeed, newPos)

-- Random walk of n steps, including start
randomWalk :: Int -> State RNGState [Position]
randomWalk n = do
    (_, startPos) <- get
    let go 0 acc = return (reverse acc)
        go k acc = do
            randomStep
            (_, pos) <- get
            go (k-1) (pos:acc)
    go n [startPos]

-- Main to test
main :: IO ()
main = do
    let startState = (42, (0,0))  -- seed 42, starting at (0,0)
        path = evalState (randomWalk 10) startState
    print path
