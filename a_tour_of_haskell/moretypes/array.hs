-- While haskell also has Arrays, one normally uses lists for most use cases. Lists are of course also immutable.
{-# ANN main "HLint: ignore" #-}

main = do
  let a = ["hello ", "world"]
  putStr (a!!0) -- equivalent: head a
  putStrLn (a!!1)

  let primes = [2, 3, 5, 7, 11, 13]
  print primes
