-- HC14T2
import System.Random

main :: IO ()
main = do
    num <- randomRIO (1,100) :: IO Int
    putStrLn ("Random number: " ++ show num)

