-- This file can not be executed with runhaskell since it does not contain a main function.
-- In Haskell, exported names are declared at the top of the module.
-- This means one sees at the top of a module file, what it exports but a function declaration does not
-- show whether it is exported. This is however irrelevant because one uses API docs anyways.
-- One can switch to export a function just by adding it to the list of exported names without the need to rename it.
-- In Haskell functions are lowercase and modules and types have an uppercase first letter..

module ExportedNames (
  publicThing
) where

publicThing :: String
publicThing = "you can see me"

privateThing :: String
privateThing = "you can not see me"

