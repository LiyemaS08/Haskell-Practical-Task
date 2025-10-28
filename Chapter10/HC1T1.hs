-- HC1T1 - Task 1: Function Composition

-- Function to double a number
double :: Int -> Int
double x = x * 2

-- Function to increment a number
increment :: Int -> Int
increment x = x + 1

-- Function composition: apply double first, then increment
doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double

-- Main function to test
main :: IO ()
main = do
  print (doubleThenIncrement 3)   -- Expected output: 7
  print (doubleThenIncrement 10)  -- Expected output: 21
