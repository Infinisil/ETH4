Lemma: rev (xs ++ rev ys) .=. ys ++ rev xs

Proof by induction on List xs
Case []
    To show: rev ([] ++ rev ys) .=. ys ++ rev []
    Proof
        rev ([] ++ rev ys)
        (by def ++) .=. rev (rev ys)
        (by rev_rev) .=. ys
        (by app_Nil) .=. ys ++ []
        (by def rev) .=. ys ++ rev []
    QED
Case x:xs
    To show: rev ((x:xs) ++ rev ys) .=. ys ++ rev (x:xs)
    IH: rev (xs ++ rev ys) .=. ys ++ rev xs
    Proof
        rev ((x:xs) ++ rev ys)
        (by def ++) .=. rev (x : (xs ++ rev ys))
        (by def rev) .=. rev (xs ++ rev ys) ++ [x]
        (by IH) .=. (ys ++ rev xs) ++ [x]
        (by app_assoc) .=. ys ++ (rev xs ++ [x])
        (by def rev) .=. ys ++ rev (x:xs)
    QED
QED
