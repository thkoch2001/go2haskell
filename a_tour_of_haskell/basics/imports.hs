-- Haskell can not combine multiple imports into one import statement.
-- It surely must be an extremely important feature, if Go mentions it so early in its tour.
-- The sqrt method is in Haskells standard library (called Prelude) and does not need to be imported.

import Text.Printf

main = printf "Now you have %.2f problems." (sqrt 7::Double)
