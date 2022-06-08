module Main (main) where

import Data.List

main :: IO ()
main = do
  _n <- getLine
  xs <- sortBy (flip compare) . map read . words <$> getLine :: IO [Int]
  let delta = snd $ foldl (\(sign, acc) x -> (negate sign, acc + sign * x)) (1, 0) xs
   in print delta
