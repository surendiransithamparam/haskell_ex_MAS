{-# LANGUAGE ScopedTypeVariables #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    it "Exercise 1.1" $ pendingWith "No automated tests."
    it "Exercise 1.2" $ pendingWith "No automated tests."
    describe "Exercise 1.3" $ do
        describe "product" $ do
            it "product [2,3,4] == 24" $
                Ex.product [2,3,4] `shouldBe` 24
            it "behaves like prelude `product`" $
                property $ \(xs::[Int]) ->
                    Ex.product xs == product xs
