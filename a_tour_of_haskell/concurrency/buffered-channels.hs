-- Haskell channels are unbounded. But Haskells Software Transactional Memory (STM) module contains
-- the type TBQueue which is bound.

-- The second do block here is necessary to wrap the code that uses STM.

-- Try to uncomment the third writeTBQueue line to see Haskells deadlock detection!

import           Control.Concurrent.STM         (atomically)
import           Control.Concurrent.STM.TBQueue (newTBQueue, readTBQueue,
                                                 writeTBQueue)

main = do
  (v1, v2) <- atomically $ do
    ch <- newTBQueue 2
    writeTBQueue ch 1
    writeTBQueue ch 2
    -- writeTBQueue ch 3
    v1 <- readTBQueue ch
    v2 <- readTBQueue ch
    return (v1, v2)
  print v1
  print v2
