mc : Int -> Int
mc n = if n > 100 then
          n - 10 else -- n > 100
          mc (mc (n + 11)) -- n <= 100
