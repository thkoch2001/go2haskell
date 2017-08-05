-- Haskell does not have a mutable map. Instead Haskellers prefer to pass around references to new versions of a map.
-- https://stackoverflow.com/questions/2233409/haskell-mutable-map-tree

import qualified Data.Map.Strict as Map

main = do
  let m = Map.empty :: Map.Map String Int

  let m1 = Map.insert "Answer" 42 m
  putStrLn $ "The value: " ++ (getAnswer m1)

  let m2 = Map.insert "Answer" 48 m
  putStrLn $ "The value: " ++ (getAnswer m2)

  let m3 = Map.delete "Answer" m2
  putStrLn $ "The value: " ++ (getAnswer m3)

  -- lookup wraps the return value in a Maybe type which can be either (Just value) or Nothing.
  let answer = Map.lookup "Answer" m3
  putStrLn $ "The value (maybe): " ++ (show answer)

  where
    getAnswer m = case (Map.lookup "Answer" m) of
      Just answer -> show answer
      Nothing     -> "I don't know the answer."