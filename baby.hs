import Data.List

doubleMe :: Int -> Int
doubleMe x = x + x

doubleUs :: Int -> Int -> Int
doubleUs x y = x*2 + y*2

doubleSmallNumber :: Int -> Int
doubleSmallNumber x = if x > 100
  then x
  else x*2

bobO'hare :: [Char]
bobO'hare = "Hello Bob O'Hare!"

walken :: ([Char], [Char], Int)
walken = ("Christopher", "Walken", 55)

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Out of luck :("

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe x = "That fucking number is over four!"

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "That's a fucking empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

-- | Higher Order Functions
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- | Modules
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub
