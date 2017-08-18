compute :: (Double -> Double -> Double) -> Double
compute fn = fn 3 4

main = do
  let hypot x y = sqrt (x*x + y*y)

  print (hypot 5 12)

  print (compute hypot)

  print (compute (**))
