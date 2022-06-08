module Main (main) where

main :: IO ()
main = do
  n500 <- read <$> getLine :: IO Int
  n100 <- read <$> getLine :: IO Int
  n50 <- read <$> getLine :: IO Int
  total <- read <$> getLine :: IO Int

  print $
    sum
      [ 1
        | x500 <- [0 .. n500],
          x100 <- [0 .. n100],
          x50 <- [0 .. n50],
          500 * x500 + 100 * x100 + 50 * x50 == total
      ]
