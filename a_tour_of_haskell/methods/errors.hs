-- Haskell has a couple of mechanism to deal with different categories of errors, even exceptions.
-- The easiest mechanisms are the Maybe type already used in ... and the Either type used here.

-- I ommited the time in the error type since it would have made the run function impure and thus
-- more complex. A pure function can not interact with IO and the current time would be an input
-- from the outside world.

data MyError = MyError String deriving (Show)

run :: String -> Either MyError String
run "42" = Right "This is the correct answer."
run _    = Left (MyError "This is not the answer.")

main = do
  putStrLn "What is the answer?"
  input <- getLine
  case run input of
    Left err     -> print err
    Right result -> print result
