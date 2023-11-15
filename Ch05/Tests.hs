{-# LANGUAGE ScopedTypeVariables #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck
import Data.List ( elemIndices )


main :: IO ()
main = hspec $ do
    describe "Exercise 5.1" $ do
        it "Computes the sum of squares of the first 100 integers" $
            Ex.e5_1 `shouldBe` 338350
    describe "Exercise 5.4" $ do
        it "`myReplicate` replicates a given character 5 times" $
            Ex.replicate 5 'a' `shouldBe` "aaaaa"
        it "`myReplicate` behaves just like its reference implementation `replicate`" $
            property $ \(n::Int) (xs::[Int]) ->
                Ex.replicate n xs == replicate n xs
    describe "Exercise 5.8" $ do
        it "`position` correctly finds all positions of o in potato " $
            Ex.positions 'o' "potato" `shouldBe` [1,5]
        it "`positions` behaves just like its reference implementation `elemIndices`" $
            property $ \(x::Char) (xs::[Char]) ->
                Ex.positions x xs == elemIndices x xs
