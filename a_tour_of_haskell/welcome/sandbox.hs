import Data.Time

main = do
  putStrLn "Welcome to the playground!"
  t <- fmap show getZonedTime
  putStrLn ("The time is " ++ t)