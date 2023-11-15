# Haskell Shoot-em-up

Welcome to the Haskell Shoot-em-up! This repository contains a selection of (in
some cases modified) exercises from ”Programming in Haskell” by Graham Hutton
http://www.cs.nott.ac.uk/~pszgmh/pih.html. The idea is to get fast feedback from
automated tests, so you can solve the exercises one-by-one and get a hint if you
make an error.

## Installation

1. Install [stack](https://docs.haskellstack.org/en/stable/) and
   [GHC](https://www.haskell.org/ghc/) using
   [GHCUP](https://www.haskell.org/ghcup/) (follow the installation instructions
   on the GHC website).
2. Clone this repo (`git clone ...`) into a local working folder.

## Usage

Solve an exercise from a chapter. You will find the exercise file under
`ChXX/Exercises.hs`, where `XX` is any chapter number.

In your command shell, execute 

``` sh
stack test ChXX
```

(where XX is the current chapter number), to test your progress on the current
chapter. The output will look something like this:

```
Exercise 1.1 [‐]
  # PENDING: No automated tests.
Exercise 1.2 [‐]
  # PENDING: No automated tests.
Exercise 1.3
  product
    product [2,3,4] == 24 [✘]
    behaves like prelude `product` [✘]
```

From this, you can derive that exercise 1.1 and 1.2 have no automated tests
(because their solution does not require Haskell code), and that exercise 1.3 is
not solved correctly yet. You can also see which test cases fail. If some tests
fail, an extended report is also provided: 

``` 
Failures:

  Tests.hs:13:36: 
  1) Exercise 1.3, product, product [2,3,4] == 24
       expected: 24
        but got: 1

  To rerun use: --match "/Exercise 1.3/product/product [2,3,4] == 24/"

  Tests.hs:14:13: 
  2) Exercise 1.3, product, behaves like prelude `product`
       Falsified (after 1 test):
         []

  To rerun use: --match "/Exercise 1.3/product/behaves like prelude `product`/"
```

From the first failure report we can see that our faulty `product`
implementation does not produce `24` on the input `[2,3,4]`, but `1`.

The second failure report is from a [property-based
test](https://jesper.sikanda.be/posts/quickcheck-intro.html). It will give an
example of an input that failed. In this case, our `product` implementation
failed on the input `[]` (because it returned `0`, while the reference prelude
implementation returned `1`).

### Other Commands

You can also execute all tests from all chapters at once using 

``` sh
stack test
```

If you just want to build, but not execute any tests, use

``` sh
stack build ChXX
```

or

``` sh
stack build
```


## Debugging

If stack complains that there is no matching GHC version, make sure that you
installed GHC version `9.4.7` using 

``` sh
ghcup tui
```
