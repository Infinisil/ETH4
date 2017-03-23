
data Edit = Change Char |
            Copy |
            Delete |
            Insert Char

Show Edit where
  show (Change c) = "Change " ++ singleton c
  show Copy = "Copy"
  show Delete = "Delete"
  show (Insert c) = "Insert " ++ singleton c

cost : Edit -> Integer
cost Copy = 0
cost _ = 1

lcost : List Edit -> Integer
lcost [] = 0
lcost (x::xs) = cost x + lcost xs

minList : Ord a => List a -> a
minList = foldl1 min

lcosts : List (List Edit) -> List Integer
lcosts = map lcost

best : List (List Edit) -> List Edit
best [x] = x
best (x::xs) = if lcost x < lcost b then x else b
  where
    b = best xs


transform : List Char -> List Char -> List Edit
transform [] [] = []
transform xs [] = map (\_ => Delete) xs
transform [] ys = map Insert ys
transform (x::xs) (y::ys) with (x == y)
  | True = Copy :: transform xs ys
  | _ = best [Change y :: transform xs ys,
             Delete :: transform xs (y::ys),
             Insert y :: transform (x::xs) ys]

transform' : String -> String -> List Edit
transform' a b = transform (unpack a) (unpack b)

main : IO ()
main = repl "> " int where
  intWords : List String -> String
  intWords (a::b::_) = show (transform' a b) ++ "\n"
  intWords _ = "Not enough words! Give at least 2\n"
  
  int : String -> String
  int s = intWords (words s)

  
