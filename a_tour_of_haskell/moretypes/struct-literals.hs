-- Haskell does not have support for default values of types in the language. But Data.Default is a library that provides that.
import Data.Default

data Vertex = Vertex { x :: Int
                     , y :: Int
} deriving (Show)

instance Default Vertex where
  def = Vertex 0 0

v1 = Vertex 1 2
v2 = def {x = 1} :: Vertex
v3 = def :: Vertex

main = do
  print v1
  print v2
  print v3