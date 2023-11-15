{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE TypeApplications #-}
import qualified Exercises as Ex
import Test.Hspec
import Test.QuickCheck
import Test.Validity

nat2int :: Ex.Nat -> Int
nat2int Ex.Zero = 0
nat2int (Ex.Succ n) = 1 + nat2int n

int2nat :: Int -> Ex.Nat
int2nat 0 = Ex.Zero
int2nat n = Ex.Succ (int2nat (n-1))

instance Arbitrary Ex.Nat where
    arbitrary :: Gen Ex.Nat
    arbitrary = int2nat . abs <$> arbitrary

-- >>> :t int2nat <$> abs <$> arbitrary
-- int2nat <$> abs <$> arbitrary :: Gen Nat

-- >>> sample' (arbitrary :: Gen Nat)
-- [Zero,Succ Zero,Succ Zero,Zero,Succ (Succ (Succ (Succ (Succ Zero)))),Succ (Succ Zero),Succ Zero,Succ (Succ (Succ (Succ (Succ (Succ Zero))))),Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero))))))))))),Succ (Succ (Succ Zero)),Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ (Succ Zero)))))))))))]

instance Arbitrary Ex.Expr where
    arbitrary :: Gen Ex.Expr
    arbitrary = sized tree
      where
        tree 0 = Ex.Val <$> arbitrary
        tree n | n > 0 = Ex.Add <$> (subtree n) <*> (subtree n)
        subtree n = oneof [Ex.Val <$> arbitrary, tree (n `div` 2)]

-- >>> sample' (arbitrary :: Gen Expr)
-- [Val 0,Add (Val 0) (Add (Val (-2)) (Val 1)),Add (Val 1) (Val 1),Add (Val 0) (Add (Val 5) (Add (Val 3) (Val 2))),Add (Val 0) (Val 3),Add (Add (Add (Val 7) (Add (Val 9) (Val 9))) (Add (Val (-9)) (Add (Val 2) (Val (-1))))) (Val (-6)),Add (Val 2) (Add (Add (Val 8) (Val 5)) (Val 8)),Add (Add (Val 11) (Add (Add (Val 6) (Val (-6))) (Val (-13)))) (Add (Val 7) (Val 2)),Add (Val 7) (Val 7),Add (Add (Add (Val 18) (Val 17)) (Val (-14))) (Val 12),Add (Val (-14)) (Val (-6))]

-- The test for `folde` in exercise 8.5 requires a correct implementation of  `(=)` which is the solution of exercise 8.7. The test for exercise 8.5 therefore requires the correct solution of exercise 8.7. In order for exercise 8.5 to be tested independently of exercise 8.7, the following alternative definition of equality is used.
localEquals :: Ex.Expr -> Ex.Expr -> Bool
localEquals (Ex.Val i) (Ex.Val j) = i == j
localEquals (Ex.Add e11 e12) (Ex.Add e21 e22) = e11 `localEquals` e21 && e12 `localEquals` e22
localEquals _ _ = False

instance Arbitrary a => Arbitrary (Ex.List a) where
    arbitrary :: Gen (Ex.List a)
    arbitrary = fromHaskellList <$> arbitrary
        where
            fromHaskellList [] = Ex.Nil
            fromHaskellList (x:xs) = Ex.Cons x (fromHaskellList xs)

main :: IO ()
main = hspec $ do
    describe "Exercise 8.1" $ do
        describe "mult" $ do
            it "behaves just like (*)" $
                property $ \ n m -> Ex.mult n m == int2nat (nat2int n * nat2int m)

    describe "Exercise 8.5" $ do
        describe "folde" $ do
            it "Returns an identical expresion if given the constructors" $
                property $ \ e -> Ex.folde Ex.Val Ex.Add e `localEquals` e

    describe "Exercise 8.6" $ do
        describe "eval" $ do
            it "correctly evaluates 10" $
                Ex.eval (Ex.Val 10) `shouldBe` 10
            it "correctly evaluates 1+1" $
                Ex.eval (Ex.Add (Ex.Val 1) (Ex.Val 1)) `shouldBe` 2
        describe "size" $ do
            it "correctly calculates the size of 10" $
                Ex.size (Ex.Val 10) `shouldBe` 1
            it "correctly calculates the size of 1+1" $
                Ex.size (Ex.Add (Ex.Val 1) (Ex.Val 1)) `shouldBe` 2

    describe "Exercise 8.7" $ do
        describe "(==) for Expr" $ do
            it "is reflexive" $
                property $ \ (e::Ex.Expr) -> e == e
            it "is not true for the expressions representing 10 and 5+5" $
                Ex.Add (Ex.Val 5) (Ex.Val 5) == Ex.Val 10 `shouldBe` False
            it "is false for different `Val`s" $
                Ex.Val 5 == Ex.Val 23 `shouldBe` False
            it "compares `Val`s by value" $
                property $ \ n m -> Ex.Val n == Ex.Val m `shouldBe` n == m
            it "is false for `Add`s with swapped distinct operands" $
                Ex.Add (Ex.Val 2) (Ex.Val 3) == Ex.Add (Ex.Val 3) (Ex.Val 2) `shouldBe` False
            it "compares `Add`s by their operands" $
                property $ \ a b x y -> Ex.Add a b == Ex.Add x y `shouldBe` a `localEquals` x && b `localEquals` y
            it "behaves as one would expect" $
                property $ \ (e1::Ex.Expr) e2 -> e1 == e2 `shouldBe` (e1 `localEquals` e2)
            eqSpecOnArbitrary @Ex.Expr
        describe "(==) for List" $ do
            it "is reflexive" $
                property $ \ (e::Ex.List Int) -> e == e
            it "is not true for the lists Nil and Cons 1 Nil" $
                Ex.Cons 1 Ex.Nil == Ex.Nil `shouldBe` False
            eqSpecOnArbitrary @(Ex.List Int)
