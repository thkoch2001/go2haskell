-- Haskell typeclasses allow you to add instances to types without
-- changing the original type. This gives the same flexibility as
-- duck typing but with clear statement of intend and without insecurity.

class Abser f where
  my_abs :: f -> Float

data Vertex = Vertex Float Float

instance Abser Vertex where
  my_abs (Vertex x y) = sqrt (x*x + y*y)

data MyFloat = MyFloat Float

instance Abser MyFloat where
  my_abs (MyFloat f)
    | f < 0 = -f
    | otherwise = f

main = do
  let f = MyFloat (- sqrt 2)
  let v = Vertex 3 4

  print (my_abs f)
  print (my_abs v)