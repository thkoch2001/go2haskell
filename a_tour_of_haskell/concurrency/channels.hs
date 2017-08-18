import           Control.Concurrent      (forkIO)
import           Control.Concurrent.Chan (newChan, readChan, writeChan)

sumFork s c = writeChan c (sum s)

main = do
  let s  = [7, 2, 8, -9, 4, 0]
  let (s1, s2) = splitAt (quot (length s) 2) s

  c <- newChan
  forkIO $ sumFork s1 c
  forkIO $ sumFork s2 c
  x <- readChan c
  y <- readChan c

  print x
  print y
  print $ x + y
