module Main where

newtype Parser a = Parser { runParser :: String -> [(a, String)] }

instance Functor Parser where
  fmap f (Parser p) = Parser $ \input ->
    [(f v, out) | (v, out) <- p input]

instance Applicative Parser where
  pure v = Parser $ \input -> [(v, input)]
  Parser pf <*> Parser pa = Parser $ \input ->
    [(f a, out2) | (f, out1) <- pf input, (a, out2) <- pa out1]

instance Monad Parser where
  Parser pa >>= f = Parser $ \input ->
    concat [runParser (f a) out | (a, out) <- pa input]

charP :: Char -> Parser Char
charP c = Parser $ \input ->
  case input of
    (x:xs) | x == c -> [(c, xs)]
    _               -> []

main :: IO ()
main = print (runParser (charP 'a') "abc")

