{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}


module Main where

import GHC.Generics
import Web.Scotty
import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)

data User = User { userId :: Int, userName :: String } deriving (Show, Generic)

instance ToJSON User
instance FromJSON User

bob :: User
bob = User { userId = 1, userName = "bob" }

jenny :: User
jenny = User { userId = 2, userName = "jenny" }

allUsers :: [User]
allUsers = [bob, jenny]

routes :: ScottyM ()
routes = do
  get "/" $ do
    text "Hello world!"
  get "/greeting/:name" $ do
    name <- param "name"
    text ("Hello " <> name <> "!")
  get "/users" $ do
    json allUsers
main = do
  putStrLn "Starting server..."
  scotty 3333 routes
