-- Haskell does know about types only at compile time, not at runtime. Therefor
-- we can not switch over types. But we can implement typeclass instances for
-- different types.

-- Here we need the FlexibleInstances extension because we want to write a
-- typeclass instance for String. But String is actually a type synonym for the
-- nested type [Char].
-- see https://wiki.haskell.org/List_instance
{-# LANGUAGE FlexibleInstances #-}

import Text.Printf

class MessageForType a where
  message :: a -> String

instance MessageForType String where
  message s = printf "%s is %v characters long." s (length s)

instance MessageForType Int where
  message n = printf "Twice %v is %v." n (2*n)

-- The OVERLAPPABLE pragma declares that we are aware that
-- this instance could be overriden by a more specific one.
-- Generally you want to avoid a 'default' instance like this
-- because it hides missing instances.
instance {-# OVERLAPPABLE #-} MessageForType a where
  message _ = "I don't know about this type, not even its name."

main = do
  print (message (21::Int))
  print (message "hello")
  print (message True)