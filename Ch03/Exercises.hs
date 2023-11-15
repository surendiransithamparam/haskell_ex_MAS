module Exercises where

-------------------------------------------------------------------------------
--                              Exercise 3.1 (*)                             --
-------------------------------------------------------------------------------
-- What are the types of the following values?
-- Uncomment your answers in order for them to be checked by the compiler.

e3_1_1 = ['a','b','c']
-- e3_1_1 :: TODO

e3_1_2 = ('a','b','c')
-- e3_1_2 :: TODO

e3_1_3 = [(False,'O'),(True,'1')]
-- e3_1_3 :: TODO

e3_1_4 = ([False,True],['0','1'])
-- e3_1_4 :: TODO

e3_1_5 = [tail, init, reverse]
-- e3_1_5 :: TODO


-------------------------------------------------------------------------------
--                              Exercise 3.2 (*)                             --
-------------------------------------------------------------------------------
-- Write down definitions that have the following types; it does not matter what
-- the definitions actually do as long as they are type correct. The type of
-- your defined function may be more general than the types defined below.

bools :: [Bool]
bools = {- TODO -} undefined

nums :: [[ Int ]]
nums = {- TODO -} undefined

add :: Num a => a -> a -> a -> a
add {- TODO -} = {- TODO -} undefined

copy :: b -> (b, b)
copy {- TODO -} = {- TODO -} undefined

apply :: (t1 -> t2) -> t1 -> t2
apply {- TODO -} = {- TODO -} undefined


-------------------------------------------------------------------------------
--                              Exercise 3.3 (**)                            --
-------------------------------------------------------------------------------
-- What are the types of the following functions?
-- Hint: take care to include the necessary class constraints in the types if
-- the functions are defined using overloaded operators.
-- Uncomment your answers in order for them to be checked by the compiler.


second xs = head (tail xs)
-- second :: TODO

swap (x,y) = (y,x)
-- swap :: TODO

pair x y = (x,y)
-- pair :: TODO

double x = x*2
-- double :: TODO

palindrome xs = reverse xs == xs
-- palindrome :: TODO

twice f x = f (f x)
-- twice :: TODO


-------------------------------------------------------------------------------
--                              Exercise 3.4 (*)                             --
-------------------------------------------------------------------------------
-- Check your answers to the preceding three questions using GHCi.
-- Copy and paste your ghci session into the block comment below.
{-
TODO
-}

-------------------------------------------------------------------------------
--                              Exercise 3.5 (**)                            --
-------------------------------------------------------------------------------
-- Why is it not feasible in general for function types to be instances of the
-- Eq class? When is it feasible? Hint: two functions of the same type are equal
-- if they always return equal results for equal arguments. Try to define a
-- function that computes whether two functions (its inputs) are equal.

-- Type your answer into the block comment below.
{-
TODO
-}
