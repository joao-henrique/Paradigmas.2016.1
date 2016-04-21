{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as B



data Ticker = Ticker
              { high :: Number,
                last :: Number,
                bid :: Number,
                volume :: Number,
                low :: Number,
                ask :: Number
              } deriving Show



instance FromJSON Ticker where
        parseJSON (Object v) = Ticker
                               v .: "high"
                               v .: "last"
                               v .: "bid"
                               v .: "volume"
                               v .: "low"
                               v .: "ask"



ticker::(MonadIO m) => m (Maybe Ticker)
ticker = get "ticker" >>= return . decode
get::(MonadIO m) => String -> m ByteString
get url = simpleHttp $ "localhost:3000/"

main = do
  ticker >>= print
