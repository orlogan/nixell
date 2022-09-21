{-# OPTIONS_GHC -Wall #-}

-- https://www.cis.upenn.edu/~cis1940/spring13/lectures.html

module HWOne (
toDigits,
toDigitsRev,
doubleEveryOther
) where

toDigits :: Integer -> [Integer]
toDigits n
  | n > 0     = toDigits (n `div` 10) ++ [n `mod` 10]
  | otherwise = []

toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n > 0     = n `mod` 10 : toDigitsRev (n `div` 10)
  | otherwise = []

-- Not implemented correctly, need to go from the back
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (x:y:xs) = x : 2*y : doubleEveryOther xs
doubleEveryOther _ = []
