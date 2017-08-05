import qualified Data.Map.Strict as Map

data Vertex = Vertex Double Double deriving (Show)

main = do
  let m = Map.singleton "Bell Labs" $ Vertex 40.68433 (-74.39967)
  print m