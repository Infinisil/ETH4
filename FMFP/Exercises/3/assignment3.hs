prime :: Int -> Bool
prime n
  | n < 2 = False
  | n == 2 = True
  | n `mod` 2 == 0 = False
prime n = null [x | x <- [3,5 .. sqrt' n], n `mod` x == 0]

sqrt' :: Int -> Int
sqrt' = floor . sqrt . fromIntegral


