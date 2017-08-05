-- The Haskell equivalent to Go's Stringer interface is the
-- Show typeclass.

import Text.Printf

data Person = Person {name :: String, age :: Int}

instance Show Person where
  show p = printf "%v (%v years)" (name p) (age p)

main = do
  let a = Person "Arthur Dent" 42
  let z = Person "Zaphod Beeblebrox" 9001
  print a
  print z