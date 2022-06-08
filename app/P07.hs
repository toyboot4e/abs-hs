module Main (main) where

import Control.Monad
import Data.List

dedupSortedRec :: Ord a => [a] -> [a] -> [a]
dedupSortedRec acc [] = acc
dedupSortedRec acc@(a : _) (x : xs)
  | a == x = dedupSortedRec acc xs
  | otherwise = dedupSortedRec (x : acc) xs
dedupSortedRec [] _ = error "unreachable"

dedupSorted :: Ord a => [a] -> [a]
dedupSorted [] = []
dedupSorted (x : xs) = dedupSortedRec [x] xs

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  ds <- replicateM n getLine
  print $ length $ dedupSorted ds
