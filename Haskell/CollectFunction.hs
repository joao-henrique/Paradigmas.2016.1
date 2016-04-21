import Data.List
import Data.Char

main = do
    let strs = ["peach", "apple", "pear", "plum"]

    print $ lookup "pear" (zip strs [0..])
    print $ elem "grape" strs
    print $ any (isPrefixOf "p") strs
    print $ all (isPrefixOf "p") strs
    print $ filter (elem 'e') strs
    print $ map (map toUpper) strs
