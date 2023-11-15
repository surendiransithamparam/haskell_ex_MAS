{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Exercises where

import Prelude hiding ((^), and, concat, replicate, (!!), elem)


------------------------------------------------------------------------
--                          Exercise 6.2 (*)                          --
------------------------------------------------------------------------
-- Define a recursive function sumdown :: Int -> Int that returns the sum of the
-- non-negative integers from a given non-negative integer to zero. For example,
-- sumdown 3 should return the result 3 + 2 + 1 + 0 = 6.

sumdown :: Int -> Int
sumdown = {- TODO -} undefined

------------------------------------------------------------------------
--                          Exercise 6.3 (*)                          --
------------------------------------------------------------------------
-- Redefine the exponentiation operator ^ for non-negative integers using the same
-- pattern of recursion as the multiplication operator *, and show how the
-- expression 2 ^ 3 is evaluated using your definition.

(^) ::  Int -> Int -> Int
-- ??? ^# ??? = ???
-- ??? ^# ??? = ???
(^) = {- TODO -} undefined

{-
2^3
= TODO continue
-}

------------------------------------------------------------------------
--                          Exercise 6.5 (**)                         --
------------------------------------------------------------------------
-- Using the recursive definitions given in chapter ”Recursive Functions”,
-- show how length [1,2,3], drop 3 [1,2,3,4,5], and init [1,2,3] are evaluated.

-- length :: [a] -> Int
-- length [] = 0
-- length (_ : xs) = 1 + length xs

-- drop :: Int -> [a] -> [a]
-- drop 0 xs = xs
-- drop _ [] = []
-- drop n (_ : xs) = drop (n - 1) xs

-- init :: [a] -> [a]
-- init [_] = []
-- init (x:xs) = x : init xs

-- No executable code required.
-- Enter your solution within the block comment below.

{-
length [1,2,3]
= TODO continue

drop 3 [1,2,3,4,5]
= TODO continue

init [1,2,3]
= TODO continue
-}


------------------------------------------------------------------------
--                          Exercise 6.6 (**)                         --
------------------------------------------------------------------------
-- Without looking at the definitions from the standard prelude, redefine the
-- following library functions on lists using recursion.  Note: Most of these
-- functions are defined in the prelude using other library functions rather
-- than using explicit recursion, and are generic functions rather than being
-- specific to the type of lists.

-- (a) Decide if all logical values in a list are True:
--     and :: [Bool] -> Bool


and :: [Bool] -> Bool
-- and [] = ???
-- and (b:bs) = ???
and = {- TODO -} undefined



-- (b) Concatenate a list of lists:
--     concat :: [[a]] -> [a]

concat :: [[a]] -> [a]
-- concat [] = ???
-- concat (xs:xss) = ???
concat = {- TODO -} undefined


-- (c) Produce a list with a non-negative number of identical elements:
--     replicate :: Int -> a -> [a]

replicate :: Int -> a -> [a]
-- replicate 0 ??? = ???
-- replicate n ??? = ???
replicate = {- TODO -} undefined


-- (d) Select the nth element of a list:
--     (!!) :: [a] -> Int -> a

(!!) :: [a] -> Int -> a
-- ??? !! ??? = ???
-- ??? !! ??? = ???
(!!) = {- TODO -} undefined


-- (e) Decide if a value is an element of a list:
--     elem :: Eq a => a -> [a] -> Bool

elem :: Eq a => a -> [a] -> Bool
-- elem ??? = ???
-- elem ??? = ???
elem = {- TODO -} undefined


------------------------------------------------------------------------
--                          Exercise 6.7 (**)                         --
------------------------------------------------------------------------
-- Define a recursive function merge :: Ord a => [a] -> [a] -> [a] that merges
-- two sorted lists to give a single sorted list. For example:
-- > merge [2 ,5 ,6] [1 ,3 ,4]
-- [1,2,3,4,5,6]
-- Note: your definition should not use other functions on sorted lists such as
-- insert or isort, but should be defined using explicit recursion.

merge :: Ord a => [a] -> [a] -> [a]
-- merge ??? = ???
-- merge ??? = ???
-- merge ??? = ???
merge = {- TODO -} undefined


------------------------------------------------------------------------
--                          Exercise 6.8 (**)                         --
------------------------------------------------------------------------

-- Using merge, define a function msort :: Ord a => [a] -> [a] that implements
-- merge sort, in which the empty list and singleton lists are already sorted,
-- and any other list is sorted by merging together the two lists that result
-- from sorting the two halves of the list separately.
-- Hint: first define a function halve :: [a] -> ([a],[a]) that splits a list
-- into two halves whose lengths differ by at most one.


halve :: [a] -> ([a], [a])
halve = {- TODO -} undefined

msort :: Ord a => [a] -> [a]
msort = {- TODO -} undefined
