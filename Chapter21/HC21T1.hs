module Main where

newtype Writer w a = Writer { runWriter :: (a, w) }

tell :: Monoid w => w -> Writer w ()
tell w = Writer ((), w)

addW, subW, mulW :: Int -> Int -> Writer [String] Int
addW x y = Writer (x + y, ["Added " ++ show x ++ " + " ++ show y])
subW x y = Writer (x - y, ["Subtracted " ++ show x ++ " - " ++ show y])
mulW x y = Writer (x * y, ["Multiplied " ++ show x ++ " * " ++ show y])

calcDemo :: Writer [String] Int
calcDemo =
  let Writer (a, log1) = addW 3 5
      Writer (b, log2) = subW a 2
      Writer (c, log3) = mulW b 4
  in Writer (c, log1 ++ log2 ++ log3)

main :: IO ()
main = print (runWriter calcDemo)

