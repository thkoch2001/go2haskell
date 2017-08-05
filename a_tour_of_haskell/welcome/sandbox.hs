import Data.Time

main = do
  putStrLn "Welcome to the playground!"
  time <- getZonedTime
  putStrLn ("The time is " ++ show time)