-- The pattern matching is way more powerful than a simple switch statement. For example it can destruct data structures. But this is not shown here.

import System.Info (os)

main = do
  putStr "Haskell runs on "
  case os of
    "darwin" -> putStrLn "OS X."
    "linux" -> putStrLn "Linux."
    other -> putStrLn other