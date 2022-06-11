module Main (main) where

import Control.Monad
import GHC.Exts (sortWith)

solve :: [Int] -> [Int] -> [Int] -> Bool
solve [_] [_] [_] = False
solve (lt : t : ts) (lx : x : xs) (ly : y : ys) =
  let dx = dist lx ly x y
      dt = t - lt
      rest = dt - dx
   in rest >= 0 && even rest
        && solve (t : ts) (x : xs) (y : ys)
solve _ _ _ = error "unreachable"

dist :: Int -> Int -> Int -> Int -> Int
dist x1 y1 x2 y2 = abs (x2 - x1) + abs (y2 - y1)

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  txy <- replicateM n (map read . words <$> getLine :: IO [Int])

  let (ts, xs, ys) = unzip3 $ map (\[t, x, y] -> (t, x, y)) $ sortWith head txy

  if solve ts xs ys
    then putStrLn "Yes"
    else putStrLn "No"
