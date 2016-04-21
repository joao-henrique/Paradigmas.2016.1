{-# LANGUAGE DataKinds #-}
import Options.Declarative
import Control.Monad.IO.Class (liftIO)

flags :: Flag "" '["word"] "\"foo\"" "a string"     (Def "foo" String)
      -> Flag "" '["numb"] "42"      "an int"       (Def "42" Int)
      -> Flag "" '["fork"] "false"   "a bool"       Bool
      -> Flag "" '["svar"] "\"bar\"" "a string var" (Def "bar" String)
      -> Arg "ARGS" [String]
      -> Cmd "Command-Line Flags" ()
flags word numb fork svar args = do
    liftIO . putStrLn $ "word:" ++ get word
    liftIO . putStrLn $ "numb:" ++ (show . get $ numb)
    liftIO . putStrLn $ "fork:" ++ (show . get $ fork)
    liftIO . putStrLn $ "svar:" ++ get svar
    liftIO . putStrLn $ "tail:" ++ (show . get $ args)

main :: IO ()
main = run_ flags
