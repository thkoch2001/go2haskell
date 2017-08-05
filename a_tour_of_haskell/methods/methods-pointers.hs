data Vertex = Vertex Float Float deriving (Show)

vertex_abs (Vertex x y) = sqrt (x*x + y*y)

vertex_scale (Vertex x y) f = Vertex (f * x) (f * y)

main = do
  let v = Vertex 3 4
  let v1 = vertex_scale v 10
  print (vertex_abs v1)
