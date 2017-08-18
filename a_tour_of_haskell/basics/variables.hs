-- Haskell does not have variables. Everything is immutable. So there are only constants.
-- A constant is the same as a function without a parameter.

c = False
python = False
java = False

main = do
  let i = 0
  putStrLn (show c ++ show python ++ show java ++ show i)
