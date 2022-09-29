{-# OPTIONS_GHC -Wall #-}

module Fibonacci (

)where

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Lazy Loads infinite list of fib nums
fibs1 :: [Integer]
fibs1 = map fib [0..]

addFirstTwo :: [Integer] -> [Integer]
addFIrstTwo [x]          = x : x : []
addFirstTwo f@(x1:x2:xs) = (x1 + x2) : f
addFirstTwo _            = [1,0]

-- O(n) runtime version of prev funct
fibs2 :: [Integer]
fibs2 = 0 : 1 : zipWith (+) fibs2 (tail fibs2)

testFibs2 :: Int -> [Integer]
testFibs2 n = take n fibs2

--- Exercise Three

data Stream a = Cons a (Stream a)

instance Show a => Show (Stream a) where
  show = show . take 20 . streamToList

streamToList :: Stream a -> [a]
streamToList (Cons y c) = y : streamToList c

--- Exercise Four

streamRepeat :: a -> Stream a
streamRepeat x = Cons x (streamRepeat x)

streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons y c) = Cons (f y) $ streamMap f c

streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f x = Cons x (streamFromSeed f (f x))