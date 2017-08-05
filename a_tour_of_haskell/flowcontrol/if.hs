-- Haskell also has if-then-else. However one rather uses pattern matching or guards or both.
-- Here we use guards.

complex_sqrt x
  | x < 0 = show (sqrt (-x)) ++ "i"
  | otherwise = show $ sqrt x

main = print [complex_sqrt 2, complex_sqrt (-4)]