module Main where

import Data.Char (digitToInt)

main :: IO ()
main = do
  line <- getLine
  print $ sum . map digitToInt $ line
