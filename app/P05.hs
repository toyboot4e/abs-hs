module Main (main) where

sumDigitsRec :: Int -> Int -> Int
sumDigitsRec 0 sum = sum
sumDigitsRec x sum = sumDigitsRec (x `div` 10) (sum + x `rem` 10)

sumDigits :: Int -> Int
sumDigits x = sumDigitsRec x 0

main :: IO ()
main = do
  [n, a, b] <- map read . words <$> getLine
  let xs = [x | x <- [1 .. n], let s = sumDigits x, a <= s && s <= b]
  print $ sum xs
