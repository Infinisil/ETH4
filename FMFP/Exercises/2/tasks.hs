import Data.List

sos_max2 :: Int -> Int -> Int -> Int
sos_max2 a b c=(\[_,b,c]->b^2+c^2)$sort[a, b, c]

calc :: Int -> Int -> Int -> Int
calc a b c=(\[a,b,c]->a+2*b+4*c)$sort[a,b,c] -- 46

equala :: (Eq a) => [a] -> Bool
equala [] = True
equala (x:xs) = all (/=x) xs && equala xs

equal :: (Eq a) => a -> a -> a -> a -> a -> Bool
equal a b c d e = equala [a, b, c, d, e]

main = do
  putStrLn . show $ sos_max2 4 2 3
  putStrLn . show $ calc 1 4 2
  putStrLn . show $ equal 1 2 3 4 1
