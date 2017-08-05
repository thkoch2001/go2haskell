-- Haskell has different types for mutable and immutable vectors. We need to use a hacky
-- printMutableVector helper function because Haskell expects that you want to freeze a
-- mutable vector as soon as possible before printing or otherwise analyzing it.

import Control.Monad (mapM_)
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as VM

main = do
  names <- V.unsafeThaw $ V.fromList ["John", "Paul", "George", "Ringo"]
  printMutableVector names

  let a = VM.slice 0 2 names
  let b = VM.slice 1 2 names
  printMutableVector a
  printMutableVector b

  VM.write b 0 "XXX"

  printMutableVector a
  printMutableVector b
  printMutableVector names

  where
    printMutableVector v = do
      vList <- fmap V.toList (V.unsafeFreeze v)
      print vList