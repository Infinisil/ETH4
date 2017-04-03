
import Data.List
import Control.Applicative

{-
   Implement a function that generates all possible board assignments.
-}

generate :: Int -> [[Int]]
-- This would be better:
--generate = permutations . enumFromTo 1
generate n = aux n n where
  aux n 1 = map (:[]) [1..n]
  aux n k = [x:xs | x <- [1..n], xs <- aux n (k-1)]

{-
   Implement a function that tests whether a given assignment is valid.
-}

test :: [Int] -> Bool
test is = and $ map ($is) [diagDown, diagUp, noSame]


diagDown = testWith (+)
diagUp = testWith (-)

testWith f = noSame . zipWith f [1..]

-- Checks that the array doesn't contain two elements that are the same
noSame :: Eq a => [a] -> Bool
noSame [] = True
noSame (x:xs) = not (x `elem` xs) && noSame xs

naivequeens :: Int -> [[Int]]
naivequeens n = filter test $ generate n


{-
   Headache of the week:
   Implement a function that solves this n queens problem in a more efficient way
   such that partial assignments get tested, whether they may be a valid full assignment,
   as early as possible 
-}

-- Uses permutations of [1..n] so that there can't be any queens in the same row and only the diagonals need to be checked.
queens :: Int -> [[Int]]
queens = filter (liftA2 (&&) diagDown diagUp) . permutations . enumFromTo 1

queens1 :: Int -> [[Int]]
queens1 n = aux1 n n

aux1 :: Int -> Int -> [[Int]]
aux1 n 1 = map (:[]) [1..n]
aux1 n k = [x:xs |
           x <- [1..n],
           xs <- aux1 n (k-1),
           not (x `elem` xs),
           not (any (==x) (zipWith (-) xs [1..] )),
           not (any (==x) (zipWith (+) xs [1..] ))
           ]

main :: IO ()
main = putStrLn . show . length $ queens1 8

