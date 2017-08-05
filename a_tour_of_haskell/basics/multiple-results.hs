-- Haskell does not support multiple return values from functions.
-- Instead Haskell supports tuppels and pattern matching.

swap x y = (y, x)

main = case swap "hello" "world" of
  (a, b) -> putStrLn (a ++ b)
