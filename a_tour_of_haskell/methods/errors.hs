data MyError = MyError String deriving (Show)

run :: String -> Either MyError String
run "42" = Right "This is the correct answer."
run _    = Left (MyError "This is not the answer.")

main = do
  putStrLn "What is the answer?"
  input <- getLine
  case (run input) of
    Left err -> print err
    Right result -> print result
