import           Data.Foldable   (forM_)
import           Data.List       (intercalate)
import qualified Data.Map.Strict as Map
import           Data.Word
import           Text.Printf

newtype IPAddr = IPAddr (Word8, Word8, Word8, Word8)

instance Show IPAddr where
  show (IPAddr (a, b, c, d)) = intercalate "." $ fmap show [a, b, c, d]

main = do
  let hosts = [("loopback", IPAddr (127, 0, 0, 1))
             , ("googleDNS", IPAddr (8, 8, 8, 8))
              ]
  forM_ hosts ( \ (name, ip) ->
    putStrLn (name ++ ": " ++ show ip)
    )
