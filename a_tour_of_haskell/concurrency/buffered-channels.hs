-- taken from http://osa1.net/posts/2013-04-08-go-ported-haskell.html by Ömer Sinan Ağacan

-- comments by original author:
-- This is where porting started getting tricky. Haskell channels are basically linked lists, and do not have length or size. In order to get a similar effect, I created a new channel type:
-- Here one difference is that Haskell doesn’t fail with a “deadlock!!” error when an extra writeBChan operation is added(or one of them is removed), but just waits forever(like in a real deadlock :-P ). I wonder whether there is a way to get an exception like that, it’s awesome.

{-# LANGUAGE NamedFieldPuns #-}
module Main where

import Control.Concurrent

-- Buffered chan
data BChan a = BChan { chan :: Chan a, size :: MVar Int, limit :: Int }

newBChan :: Int -> IO (BChan a)
newBChan bufsize = do
  chan <- newChan
  bvar <- newMVar 0
  return BChan{chan=chan, size=bvar, limit=bufsize}

readBChan :: BChan a -> IO a
readBChan BChan{chan, size, limit} = do
  ret <- readChan chan
  modifyMVar_ size $ \i -> return (i-1)
  return ret

writeBChan :: BChan a -> a -> IO ()
writeBChan bchan@BChan{chan, size, limit} val = do
  size' <- readMVar size
  if size' == limit
    then do
      threadDelay 100000
      writeBChan bchan val
    else do
      modifyMVar_ size $ \i -> return (i+1)
      writeChan chan val

main :: IO ()
main = do
  chan <- newBChan 2
  writeBChan chan 1
  writeBChan chan 2

  v1 <- readBChan chan
  print v1

  v2 <- readBChan chan
  print v2