-- https://www.schoolofhaskell.com/user/commercial/content/vector
-- https://wiki.haskell.org/Numeric_Haskell:_A_Vector_Tutorial
-- https://hackage.haskell.org/package/vector
-- https://stackoverflow.com/questions/9611904/haskell-listes-arrays-vectors-sequences
-- https://www.haskell.org/tutorial/arrays.html
-- http://www.tweag.io/posts/2017-08-09-array-programming-in-haskell.html
-- TODO: check https://blog.jle.im/entry/fixed-length-vector-types-in-haskell.html

-- Besides the easy to use list type, Haskell also has Vector variants with different characteristics.
-- An unboxed vector can only contain primitive types that are stored inline in the allocated memory slice.

import           Data.Vector.Unboxed ((!), (//))
import qualified Data.Vector.Unboxed as V

main = do
  let primes = V.fromList [2::Int, 3, 5, 7, 11, 13] -- The exact number type needs to be specified.
  let s = V.slice 1 3 primes -- the second argument is the size of the slice
  print s
