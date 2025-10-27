-- HC8T9.hs
type Address = String
type Value = Int

data Transaction = Transaction
  { from :: Address
  , to :: Address
  , amount :: Value
  , transactionId :: String
  } deriving (Show)

createTransaction :: Address -> Address -> Value -> String
createTransaction fromAddr toAddr val =
    let txId = fromAddr ++ "_to_" ++ toAddr ++ "_" ++ show val
    in transactionId (Transaction fromAddr toAddr val txId)

main :: IO ()
main = putStrLn (createTransaction "Fino" "Elsy" 50)
