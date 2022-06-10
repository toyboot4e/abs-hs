module Main (main) where

import Data.List

test :: String -> String -> Bool
test prefix s
  | Just rest <- stripPrefix prefix s = solve rest
  | otherwise = False

solve :: String -> Bool
solve [] = True
solve s = case head s of
  'e' -> test "erase" s || test "eraser" s
  'd' -> test "dream" s || test "dreamer" s
  _ -> False

main :: IO ()
main = do
  ln <- getLine
  if solve ln
    then print "YES"
    else print "NO"
