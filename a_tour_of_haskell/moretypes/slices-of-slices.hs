-- TODO https://tour.golang.org/moretypes/14
import           Data.List (intercalate)

data Player = X | O deriving (Show)

data Field = Empty | Set Player

instance Show Field where
  show Empty   = "_"
  show (Set p) = show p

data Board = Board [[Field]]

instance Show Board where
  show (Board rows) = intercalate "\n" $ map unwords $ fmap (fmap show) rows

main = do
  -- Create a tic-tac-toe board.
  let board = Board $ replicate 3 (replicate 3 Empty)

  print board
