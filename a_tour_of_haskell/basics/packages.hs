import System.Random

main = do
  number <- randomRIO (1, 10) :: IO Int
  putStrLn ("My favorite number is " ++ show number)