-- Haskell uses take and drop instead of the position of the number relative to the column.

import qualified Data.Vector as V

main = do
  let s = V.fromList [2, 3, 5, 7, 11, 13]

  let s1 = V.slice 1 3 s -- slice after first element with length 3
  print s1

  let s2 = V.take 2 s1 -- take first 2 elements
  print s2

  let s3 = V.drop 1 s2 -- drop first element
  print s3