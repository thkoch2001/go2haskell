-- thanks to https://web.archive.org/web/20160404045845/http://lukasepple.de/posts/2015-03-04-defer-in-haskell.html

-- Go's defer can be easily implemented in Haskell:
defer = flip (>>)

main = defer (putStrLn "world") $ putStrLn "hello"
