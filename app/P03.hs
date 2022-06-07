module Main where

halfRec :: [Int] -> Int -> Int
halfRec xs n =
  if any odd xs then n else halfRec halfXs (n + 1)
  where
    halfXs = map (`div` 2) xs

main :: IO ()
main = do
  _ <- read <$> getLine :: IO Int
  xs <- map read . words <$> getLine
  print $ halfRec xs 0
