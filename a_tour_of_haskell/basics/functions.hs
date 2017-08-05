-- In Haskell, function type declarations are written on a separate line. They are optional.
-- Try to delete the line starting with "add ::"

add :: Int -> Int -> Int
add x y = x + y

main = putStrLn (show (add 42 13))