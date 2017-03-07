split :: Char -> String -> [String]
split sep xs = uncurry (:) $ aux sep xs
 
aux :: Char -> String -> (String, [String])
aux _ [] = ("", [])
aux sep (x:xs)
  | x == sep    = ("", y:ys)
  | otherwise   = (x:y, ys)
    where
      (y, ys) = aux sep xs
