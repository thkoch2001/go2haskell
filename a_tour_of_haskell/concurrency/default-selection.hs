-- apt-get install libghc-control-monad-loop-dev
-- Instead of using two channels and listening on both simultaneously, we use one channel
-- but exactly define the types of messages we expect to receive over the channel.

import           Control.Concurrent           (forkIO, threadDelay)
import           Control.Concurrent.STM       (atomically)
import           Control.Concurrent.STM.TChan (newTChan, tryReadTChan,
                                               writeTChan)
import           Control.Monad                (forever)
import           Control.Monad.Trans.Class    (lift)
import           Control.Monad.Trans.Loop     (exit, repeatLoopT)


data Message = Tick | Boom


main = do
  ch <- atomically newTChan

  forkIO $ forever $ do
    threadDelay (10^5)
    atomically $ writeTChan ch Tick

  forkIO $ do
    threadDelay (5*10^5)
    atomically $ writeTChan ch Boom

  repeatLoopT $ do
    v <- lift $ atomically $ tryReadTChan ch
    case v of
      Just Tick -> lift $ putStrLn "Tick"
      Just Boom -> do
        lift $ putStrLn "Boom"
        exit
      _ -> do
        lift $ putStrLn "    ."
        lift $ threadDelay (5*10^4)

