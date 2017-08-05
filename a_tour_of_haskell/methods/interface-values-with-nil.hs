-- There is no nil in Haskell. There are no NullPointerException either.

describe :: Maybe String -> String
describe (Just s) = "Value: " ++ s
describe Nothing  = "No value."

main = do
  let i1 = Nothing
  print (describe i1)

  let i2 = Just "hello"
  print (describe i2)