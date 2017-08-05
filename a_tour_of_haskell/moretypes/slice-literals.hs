import Data.Vector

main = do
  let q = fromList [2, 3, 5, 7, 11, 13]
  print q

  let r = fromList [True, False, True, True, False, True]
  print r

  let s = fromList [(2, True)
                  , (3, False)
                  , (5, True)
                  , (7, True)
                  , (11, False)
                  , (13, True)
                  ]
  print s