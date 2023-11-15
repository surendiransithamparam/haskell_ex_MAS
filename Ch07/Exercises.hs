{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Use curry" #-}
{-# HLINT ignore "Use any" #-}
{-# HLINT ignore "Use all" #-}
module Exercises where

import Prelude hiding (any, takeWhile, dropWhile, {- map, filter, -} curry, uncurry)


------------------------------------------------------------------------
--                          Exercise 7.1 (*)                          --
------------------------------------------------------------------------
-- Show how the list comprehension [f x | x <- xs, p x] can be re-expressed
-- using the higher-order functions map and filter.

e_7_1 :: (a -> b) -> (a -> Bool) -> [a] -> [b]
-- e_7_1 f p xs = ???map???filter???
e_7_1 = {- TODO -} undefined


------------------------------------------------------------------------
--                          Exercise 7.2 (**)                         --
------------------------------------------------------------------------
-- Without looking at the definitions from the standard prelude, define the
-- following higher-order library functions on lists. Try to use the
-- higher-order functions and, or, (.), foldr and map within your definitions if
-- possible.
-- Note: in the prelude the first two of these functions are generic functions
-- rather than being specific to the type of lists.

-- (a) Decide if all elements of a list satisfy a predicate:
--     all :: (a -> Bool) -> [a] -> Bool

all :: (a -> Bool) -> [a] -> Bool
all = {- TODO -} undefined


-- (b) Decide if any element of a list satisfies a predicate:
--     any :: (a -> Bool) -> [a] -> Bool

any :: (a -> Bool) -> [a] -> Bool
any = {- TODO -} undefined


-- (c) Select elements from a list while they satisfy a predicate:
--     takeWhile :: (a -> Bool) -> [a] -> [a]

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile = {- TODO -} undefined


-- (d) Remove elements from a list while they satisfy a predicate:
--     dropWhile :: (a -> Bool) -> [a] -> [a]

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile = {- TODO -} undefined


------------------------------------------------------------------------
--                          Exercise 7.3 (**)                         --
------------------------------------------------------------------------
-- Redefine the functions map and filter using foldr.
-- Note: to avoid naming collisions, we'll name these implementations 'myMap'
-- instead of 'map' and 'myFilter' instead of 'filter'.

myMap :: (a -> b) -> [a] -> [b]
-- myMap f = foldr ??? ???
myMap = {- TODO -} undefined


myFilter :: (a -> Bool) -> [a] -> [a]
-- myFilter f = foldr ??? ???
myFilter = {- TODO -} undefined



------------------------------------------------------------------------
--                          Exercise 7.5 (**)                         --
------------------------------------------------------------------------

-- Without looking at the definitions from the standard prelude, define the
-- higher-order library function curry that converts a function on pairs into a
-- curried function, and, conversely, the function uncurry that converts a
-- curried function with two arguments into a function on pairs.
-- Hint: first write down the types of the two functions.

-- curry :: TODO
curry f = {- TODO -} undefined


-- uncurry :: TODO
uncurry f = {- TODO -} undefined
