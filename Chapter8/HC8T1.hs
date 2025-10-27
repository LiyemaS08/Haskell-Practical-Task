-- HC8T1.hs
type Address = String
type Value = Int

generateTx :: Address -> Address -> Value -> String
generateTx fromAddr toAddr val =
    "From: " ++ fromAddr ++ ", To: " ++ toAddr ++ ", Value: " ++ show val

main :: IO ()
main = putStrLn (generateTx "Lihle" "Thando" 100)
