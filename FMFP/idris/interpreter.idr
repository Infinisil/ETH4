
data Expr = Lit Int | Add Expr Expr | Sub Expr Expr

data Parser : a -> Type where
     Prs : (String -> List (a, String)) -> Parser a

parse : Parser a -> String -> List (a, String)
parse qqk


