main = do
  let s = [] :: [Int]
  print s

  let s1 = s ++ [0]
  print s1

  let s2 = s1 ++ [1]
  print s2

  let s3 = s2 ++ [2, 3, 4]
  print s3