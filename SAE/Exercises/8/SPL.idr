Z : Type
Z = Nat

V : Type
V = String

L : Type
L = String

data AExp = Val Integer
          | Var V
          | Add AExp AExp
          | Sub AExp AExp
          | Mul AExp AExp

Num AExp where
    (+) x y = Add x y
    (*) x y = Mul x y
    fromInteger x = Val x

data BExp = True
          | False
          | Not BExp
          | And BExp BExp
          | Or BExp BExp
          | Equ AExp AExp
          | Lte AExp AExp

data Stmt = Assign V AExp
          | Skip L
          | Seq Stmt Stmt
          | IfThenElse BExp L Stmt Stmt
          | While BExp L Stmt

Store : Type
Store = List (V, Integer)

get : (var : V) -> (store : Store) -> Maybe Integer
get var [] = Nothing
get var ((a, b) :: xs) = if var == a then
                            Just b else
                            Nothing

set : (var : V) -> (value : Integer) -> (store : Store) -> Store
set var value [] = [(var, value)]
set var value ((a, b) :: xs) =
  if var == a then
     (var, value) :: xs else
     (a, b) :: set var value xs

evalA : (expr : AExp) -> (store : Store) -> Maybe Integer
evalA (Val x) store = Just x
evalA (Var x) store = get x store
evalA (Add x y) store = liftA2 (+) (evalA x store) (evalA y store)
evalA (Sub x y) store = liftA2 (-) (evalA x store) (evalA y store)
evalA (Mul x y) store = liftA2 (*) (evalA x store) (evalA y store)

eagerAnd : Bool -> Bool -> Bool
eagerAnd True True = True
eagerAnd _ _ = False

eagerOr : Bool -> Bool -> Bool
eagerOr False False = False
eagerOr _ _ = True

evalB : (expr : BExp) -> (store : Store) -> Maybe Bool
evalB True store = Just True
evalB False store = Just False
evalB (Not x) store = liftA not (evalB x store)
evalB (And x y) store = liftA2 eagerAnd (evalB x store) (evalB y store)
evalB (Or x y) store = liftA2 eagerOr (evalB x store) (evalB y store)
evalB (Equ x y) store = liftA2 (==) (evalA x store) (evalA y store)
evalB (Lte x y) store = liftA2 (<=) (evalA x store) (evalA y store)

evalS : (expr : Stmt) -> (store : Store) -> Maybe Store
evalS (Assign x y) store = do a <- evalA y store
                              pure $ set x a store
evalS (Skip x) store = Just store
evalS (Seq x y) store = evalS x store >>= evalS y
evalS (IfThenElse x y z w) store = do
  cond <- evalB x store
  if cond then
     evalS z store else
     evalS w store
evalS (While x y z) store = evalS (IfThenElse x y (While x y z) (Skip y)) store
