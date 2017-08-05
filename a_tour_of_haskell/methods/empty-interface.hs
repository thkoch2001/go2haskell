-- Haskell does not know the type of variables at runtime nor does
-- it have an implicit show function for an "empty interface".
-- However most Haskell types implement typeclass Show and thus can
-- be converted to a String represantation.

-- a is a type variable without any constraint. So there is nothing
-- known about a, not even whether it is defined.
describe :: a -> String
describe something = "There is nothing known about something."

main = do
  let i = undefined
  print (describe i)
  -- Printing undefined would raise a runtime error.

  let i1 = 42
  print (describe i1)
  print (show i1)

  let i2 = "hello"
  print (describe i2)
  print (show i2)