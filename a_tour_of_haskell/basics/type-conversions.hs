x = 3 :: Int
y = 4 :: Int
f = sqrt (fromIntegral (x*x + y*y))
z = truncate f -- Haskell wants you to be explicit on how to handle the fractional part.

main = print [x, y, z]