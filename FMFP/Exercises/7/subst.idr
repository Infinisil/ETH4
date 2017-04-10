import Data.Vect

data Term = Id Int
          | Ap Term Term
          | Lam Term

%name Term t

shift : Int -> Int -> Term -> Term
shift d c (Id k) = if k >= c then Id (k + d) else Id k
shift d c (Ap t z) = Ap (shift d c t) (shift d c z)
shift d c (Lam l) = Lam (shift d (c + 1) l)

subst : Term -> Int -> Term -> Term
subst t@(Id y) x s = if (x == y) then s else t
subst (Ap t y) x s = Ap (subst t x s) (subst y x s)
subst (Lam t) x s = Lam (subst t (x + 1) (shift 1 0 s))

a : Term
a = Lam (Ap (Id 0) (Id 2))

b : Term
b = Lam (Ap (Id 0) (Id 1))

c : Term
c = Lam $ Lam $ Ap (Ap (Ap (Id 0) (Id 1)) (Id 2)) (Id 3)

d : Term
d = Lam $ Ap (Lam (Ap (Id 0) (Id 2))) (Id 0)

index : Eq elem => (x : elem) -> Vect n elem -> Maybe (Fin n)
index x [] = Nothing
index x (y :: xs) = if x == y then
                       Just (fromInteger 0) else
                       map FS (index x xs)
