import qualified Data.Map.Strict as Map

data Vertex = Vertex Double Double deriving (Show)

m = Map.fromList [("Bell Labs", Vertex 40.68433 (-74.39967))
                , ("Google", Vertex 37.42202 (-122.08408))
                 ]
main = print m