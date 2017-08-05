import Data.Bits

big :: Integer -- Haskell can not know whether one wants to use Int or Integer
big = shiftL 1 100
small = shiftR big 99

needInt x = x * 10 + 1

needFloat x = x * 0.1

main = do
  -- The $ sign is an alternative to nested paranthesis
  putStrLn $ show $ needInt small
  -- Haskell does never do implicit type conversion. Please be explicit about your intend!
  putStrLn $ show $ needFloat $ fromInteger small
  putStrLn (show (needFloat (fromInteger big)))
  putStrLn $ show $ needInt big