{-# Language QuasiQuotes #-}
module Lib
    ( someFunc
    , someJsFunc
    ) where

import Language.JavaScript.Inline

someFunc :: IO ()
someFunc = putStrLn "someFunc"


someJsFunc :: IO String
someJsFunc = [js| '' |]
