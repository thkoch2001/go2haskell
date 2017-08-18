import           Control.Concurrent (forkIO, threadDelay)
import           Control.Monad      (forM_)

say s = forM_ [0..4] (\i -> do
  putStrLn s
  threadDelay (10^5)
  )


main = do
  forkIO $ say "Hello"
  say "world"
