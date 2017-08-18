-- Control.Concurrent.TMQueue is not in the Haskell platform, therefor:
-- apt-get install libghc-stm-chans-dev
-- nice intro: https://www.snoyman.com/blog/2016/11/haskells-missing-concurrency-basics

import           Control.Concurrent             (forkIO, newMVar, readMVar,
                                                 swapMVar)
import           Control.Concurrent.STM         (atomically)
import           Control.Concurrent.STM.TMQueue (TMQueue, closeTMQueue,
                                                 newTMQueue, readTMQueue,
                                                 writeTMQueue)
import           Control.Monad                  (forM_)


-- Un-haskelly implementation of fibonacci with un-handy mutable variables (MVar) to match the go example
fibonacci n c = do
  x <- newMVar (0::Integer)
  y <- newMVar (1::Integer)

  forM_ [1..n] $ \_ -> do
    x' <- readMVar x
    y' <- readMVar y
    atomically $ writeTMQueue c x'

    swapMVar x y'
    swapMVar y (x' + y')

  atomically $ closeTMQueue c


main = do
    c <- atomically newTMQueue
    forkIO $ fibonacci 10 c
    loopChannel c (\i -> print (i::Integer))


-- helper function to mimic Go's "for range" over a channel
loopChannel :: TMQueue a -> (a -> IO ()) -> IO ()
loopChannel ch f = loopChannel_
  where
    loopChannel_ :: IO ()
    loopChannel_ = do
      mi <- atomically $ readTMQueue ch
      case mi of
        Nothing -> return ()
        Just i -> do
          f i
          loopChannel_
