{-# LANGUAGE ScopedTypeVariables #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck
import Data.List

mergeRef :: Ord a => [a] -> [a] -> [a]
mergeRef [] ys = ys
mergeRef xs [] = xs
mergeRef (x:xs) (y:ys) =   if x <= y then
                            x : mergeRef xs (y:ys)
                        else
                            y : mergeRef (x:xs) ys

main :: IO ()
main = hspec $ do
    describe "Exercise 6.2" $ do
        describe "sumdown" $ do
            it "works for 3" $
                Ex.sumdown 3 `shouldBe` 6
            it "works for 0" $
                Ex.sumdown 0 `shouldBe` 0
            it "behaves just like `sum [0..n]` for non-negative integers" $
                property $ \ (n::Int) ->
                    Ex.sumdown (abs n) == sum [1..(abs n)]

    describe "Exercise 6.3" $ do
        describe "(^)" $ do
            it "behaves just like prelude (^) for non-negative integers" $
                property $ \(n::Int) (m::Int) ->
                    abs n Ex.^ abs m == abs n ^ abs m

    describe "Exercise 6.6" $ do
        describe "and" $ do
            it "behaves just like prelude `and`" $
                property $ \(bs::[Bool]) ->
                    Ex.and bs == and bs
        describe "concat" $ do
            it "behaves just like prelude `concat`" $
                property $ \(xss::[[Char]]) ->
                    Ex.concat xss == concat xss
        describe "replicate" $ do
            it "behaves just like prelude `replicate`" $
                property $ \(n::Int) (xs::[Int]) ->
                    Ex.replicate (abs n) xs == replicate (abs n) xs
        describe "(!!)" $ do
            it "behaves just like prelude (!!)" $
                property $ \(x::Char) (xs::[Char]) (n::Int) -> let i = (abs n `mod` length (x:xs)) in
                        (x:xs) Ex.!! i == (x:xs) !! i
        describe "elem" $ do
            it "behaves just like prelude elem" $
                property $ \(x::Char) (xs::[Char]) ->
                        (x `Ex.elem` xs) == (x `elem` xs)

    describe "Exercise 6.7" $ do
        describe "merge" $ do
            it "merges lists correctly" $
                 property $ \(xs::SortedList Int) (ys::SortedList Int)->
                    Ex.merge (getSorted xs) (getSorted ys) == mergeRef (getSorted xs) (getSorted ys)

    describe "Exercise 6.8" $ do
        describe "msort" $ do
            it "sorts lists just like Data.List.sort" $
                property $ \(xs::[Int]) ->
                    Ex.msort xs == sort xs
