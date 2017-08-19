-- Every type with a total order can be used to index a Haskell array.
-- Thus we don't need an array of arrays but can use a two dimensional
-- index.

import           Data.Array (bounds, listArray, (!), (//))

data Player = X | O deriving (Show)

data Field = Empty | Set Player

instance Show Field where
  show Empty   = "_"
  show (Set p) = show p

showBoard board =
  let
    ((xmin, ymin), (xmax, ymax)) = bounds board
  in
    unlines [unwords [show (board ! (x, y)) | y <- [ymin..ymax]] | x <- [xmin..xmax]]

main = do
  -- Create a tic-tac-toe board.
  let board = listArray ((0,0), (2, 2)) (repeat Empty)

  -- The players take turns.
  let turns = [((0, 0), Set X)
             , ((2, 2), Set O)
             , ((1, 2), Set X)
             , ((1, 0), Set O)
             , ((0, 2), Set X)
             ]

  let board' = board // turns
  putStrLn $ showBoard board'
