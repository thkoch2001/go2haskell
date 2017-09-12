import           Control.Exception (finally)

-- defer is mostly finally with the arguments flipped.
-- Haskell also has the "Bracket pattern" which allows to separate resource
-- aquisition and release into a reusable function:
-- https://wiki.haskell.org/Bracket_pattern
defer = flip finally

main = defer (putStrLn "world") $ putStrLn "hello"
