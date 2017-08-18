data Vertex = Vertex Float Float deriving (Show)

vertexAbs (Vertex x y) = sqrt (x*x + y*y)

vertexScale (Vertex x y) f = Vertex (f * x) (f * y)

main = do
  let v = Vertex 3 4
  let v1 = vertexScale v 10
  print (vertexAbs v1)
