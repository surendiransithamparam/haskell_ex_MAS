{-# LANGUAGE ScopedTypeVariables #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "Exercise 7.1" $ do
        describe "e_7_1" $ do
            it "behaves just like [f x | x <- xs, p x]" $
                property $ \ (Fn(f::Int -> Int)) (Fn(p::Int -> Bool)) (xs::[Int]) ->
                    Ex.e_7_1 f p xs == [f x | x <- xs, p x]

    describe "Exercise 7.2" $ do
        describe "all" $ do
            it "behaves just like prelude `all`" $
                property $ \ (Fn(p::Char -> Bool)) (xs::[Char]) ->
                    Ex.all p xs == all p xs
        describe "any" $ do
            it "behaves just like prelude `any`" $
                property $ \ (Fn(p::Char -> Bool)) (xs::[Char]) ->
                    Ex.any p xs == any p xs
        describe "takeWhile" $ do
            it "behaves just like prelude `takeWhile`" $
                property $ \ (Fn(p::Char -> Bool)) (xs::[Char]) ->
                    Ex.takeWhile p xs == takeWhile p xs
        describe "dropWhile" $ do
            it "behaves just like prelude `dropWhile`" $
                property $ \ (Fn(p::Char -> Bool)) (xs::[Char]) ->
                    Ex.dropWhile p xs == dropWhile p xs

    describe "Exercise 7.3" $ do
        describe "myMap" $ do
            it "behaves just like prelude `map`" $
                property $ \ (Fn(f::Char -> Int)) (xs::[Char]) ->
                    Ex.myMap f xs == map f xs
        describe "myFilter" $ do
            it "behaves just like prelude `filter`" $
                property $ \ (Fn(p::Char -> Bool)) (xs::[Char]) ->
                    Ex.myFilter p xs == filter p xs

    describe "Exercise 7.5" $ do
        describe "curry" $ do
            it "behaves just like prelude `curry`" $
                property $ \ (Fn(f::(Char,Char) -> Int)) x y ->
                    Ex.curry f x y == curry f x y
        describe "uncurry" $ do
            it "is the inverse of prelude `curry`" $
                property $ \ (Fn(f::(Char,Char) -> Int)) x y ->
                    Ex.uncurry (curry f) (x,y) == f (x,y)
