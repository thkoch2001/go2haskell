-- There are some utterly complex constructs in Haskell that look like for loops.
-- But you just do recursion instead of for loops, if not using a higher level construct like map or fold. Haskell does tail recursion.

times_two_under limit = go 1 where
  go sum | sum < limit = go (sum + sum)
  go sum = sum

main = do
  putStrLn $ show $ times_two_under 1000

