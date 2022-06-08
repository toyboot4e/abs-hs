module Main (main) where

import Control.Applicative
import Data.Maybe

main :: IO ()
main = do
  [n, tot] <- map read . words <$> getLine :: IO [Int]

  -- a: 10000, b: 5000, c: 1000
  let sets =
        listToMaybe
          [ [a, b, c]
            | a <- [0 .. n],
              b <- [0 .. n],
              c <- [0 .. n],
              a + b + c == n,
              10000 * a + 5000 * b + 1000 * c == tot
          ]

  let set = fromMaybe [-1, -1, -1] sets
  putStrLn $ unwords $ map show set
