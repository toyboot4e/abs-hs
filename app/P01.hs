module Main (main) where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine
  let s = if even (a * b) then "Even" else "Odd"
  putStr s
