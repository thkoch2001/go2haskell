-- Haskell also does not have class methods. Also typeclasses in Haskell
-- are very different from classes in e.g. Java.

data Vertex = Vertex Double Double

-- abs is already defined in Haskells standard library
my_abs (Vertex x y) = sqrt (x*x + y*y)

main = do
  let v = Vertex 3 4
  print (my_abs v)
