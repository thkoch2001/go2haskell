import Control.Monad (forM_)
import Control.Concurrent (forkIO, threadDelay)

say s = do
  forM_ [0..4] (\i -> do
    putStrLn s
    threadDelay (10^5)
    )

main = do
  forkIO $ say "Hello"
  say "world"