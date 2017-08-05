-- Haskell has no for loop because it would require to mutate a counter variable.
-- Instead you have map, reduce (foldl or foldr) and many other ways to "loop" over a data structure in a type save way.

consecutive_integers_sum n = foldl (+) 0 [0 .. n]

main = putStrLn $ show $ consecutive_integers_sum 9
