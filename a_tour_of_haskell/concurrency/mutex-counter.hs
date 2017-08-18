-- We could use a mutex, but a STM TVar is just so much nicer.

import           Control.Concurrent          (forkIO, threadDelay)
import           Control.Concurrent.STM      (atomically)
import           Control.Concurrent.STM.TVar (modifyTVar', newTVar, readTVar)
import           Control.Monad               (forM_)
import qualified Data.Map.Strict             as Map

inc c key = atomically $ modifyTVar' c $ Map.insertWith (+) key 1

main = do
  c <- atomically $ newTVar (Map.empty::Map.Map String Int)
  forM_ [1..1000] $ \_ ->
    forkIO $ inc c "somekey"

  threadDelay (10^6)
  m <- atomically $ readTVar c
  print $ Map.findWithDefault 0 "somekey" m
