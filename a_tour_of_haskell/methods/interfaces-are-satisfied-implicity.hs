class I a where
  m :: a -> String

data T = T String

-- This function implements the typeclass I for type T AND explicitly declares
-- that it does so.
instance I T where
  m (T s) = s

main = do
  let i = T "hello"
  print (m i)