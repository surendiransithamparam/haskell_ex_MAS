{-# LANGUAGE ScopedTypeVariables #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck


safeTailSpec :: ([Int] -> [Int]) -> Spec
safeTailSpec safeTailFn = do
        it "returns `[]` for empty lists" $
            safeTailFn [] `shouldBe` ([]::[Int])
        it "behaves just like `tail` for non-empty lists" $
            property $ \x (xs::[Int]) ->
                safeTailFn (x:xs) == tail (x:xs)

main :: IO ()
main = hspec $ do
    describe "Exercise 4.3" $ do
        describe "safeTailA" $ safeTailSpec Ex.safeTailA
        describe "safeTailB" $ safeTailSpec Ex.safeTailB
        describe "safeTailC" $ safeTailSpec Ex.safeTailC
    describe "Exercise 4.7" $ do
        describe "mult" $ do
            it "behaves just like its reference implementation `mult x y z = x*y*z`" $
                property $ \x y (z::Int) ->
                    let refMult x y z = x*y*z in
                    Ex.mult x y z == refMult x y z
