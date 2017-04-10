import Data.Vect
import Data.So

solve : (values : Vect n Nat) -> (weights : Vect n Nat) -> (cap : Nat) -> Nat
solve [] [] cap = 0
solve (x :: xs) (y :: ys) cap = if y <= cap then
                                   max (x + solve xs ys (cap `minus` y)) 
                                       (solve xs ys cap) else
                                   solve xs ys cap
