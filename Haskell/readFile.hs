import System.IO
import Data.Char

main = do
        contDoubleSmall <- readFile "doubleSmallNumber.hs"
        contDoubleMe <- readFile "doubleMe.hs"
        writeFile "lib.hs" (contDoubleMe ++ contDoubleSmall)
