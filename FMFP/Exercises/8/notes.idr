import Data.Vect

dec : List Nat -> List Nat
dec [] = []
dec [x] = []
dec (x::y::zs) = (replicate x y) ++ (dec zs)

slen : List Nat -> Nat
slen [] = 0
slen [x] = 0
slen (x::y::zs) = x + slen zs

lengthDistributive : (x : Vect n elem) ->
                     (y : Vect m elem) ->
                     (length x + length y = length (x ++ y))
lengthDistributive x y = ?hi


syntax [a] "[" [b] "]" = index b a
