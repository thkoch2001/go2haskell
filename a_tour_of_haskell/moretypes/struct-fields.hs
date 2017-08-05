data Vertex = Vertex { x :: Int
                     , y :: Int
} deriving (Show)

main = do
  let v = Vertex 1 2
  let v' = v {x = 4} -- use a different name otherwise we program an infinite loop here
  print (x v')