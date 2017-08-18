-- In Haskell maps aren't used as frequently because one can easily create a new type instead.
-- Thus there is also not much syntactic sugar for maps.
-- https://stackoverflow.com/a/10797644/240976

-- However we can quickly map an anonymous function over the data list to transform it.

import qualified Data.Map.Strict as Map

data Vertex = Vertex Double Double deriving (Show)

m = Map.fromList $
  map (\ (x, y, z) -> (x, Vertex y z))
    [("Bell Labs", 40.68433, -74.39967)
   , ("Google", 37.42202, -122.08408)
    ]

main = print m
