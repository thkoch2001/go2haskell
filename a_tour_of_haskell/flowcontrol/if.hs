-- Haskell also has if-then-else. However one rather uses pattern matching or guards or both.
-- Here we use guards.

complexSqrt x
  | x < 0 = show (sqrt (-x)) ++ "i"
  | otherwise = show $ sqrt x

main = print [complexSqrt 2, complexSqrt (-4)]
