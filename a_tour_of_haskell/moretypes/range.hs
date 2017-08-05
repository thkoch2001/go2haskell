-- We simulate the range expression by zipping the list with an infinite incrementing list.
-- mapM_ then applies an action to every list element.

import Text.Printf

pow = [1::Int, 2, 4, 8, 16, 32, 64, 128]

main = mapM_ printPow $ zip [0::Int, 1..] pow
  where
    printPow (c, x) = printf "2**%d = %d\n" c x