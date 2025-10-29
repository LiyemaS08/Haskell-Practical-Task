-- HC18T5: Functor Instance for Either
data Either' a b = Left' a | Right' b
  deriving (Show)

instance Functor (Either' a) where
    fmap _ (Left' x)  = Left' x
    fmap f (Right' y) = Right' (f y)

main :: IO ()
main = do
    putStrLn "HC18T5: Functor Instance for Either"
    print (fmap (*2) (Right' 5 :: Either' String Int))  -- Right' 10
    print (fmap (*2) (Left' "Error" :: Either' String Int))  -- Left' "Error"

