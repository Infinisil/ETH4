fibLouis : Nat -> Nat
fibLouis Z = 0
fibLouis (S Z) = 1
fibLouis (S (S k)) = fibLouis k + fibLouis (S k) 

aux : Nat -> (Nat, Nat)
aux Z = (0, 1)
aux 1 = (1, 1)
aux 2 = (2, 1)
aux 3 = (3, 2)
aux 4 = (5, 3)
aux  = (k, n
