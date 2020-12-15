{-# Language QuasiQuotes #-}
{-# Language BlockArguments #-}
{-# Language TypeApplications #-}

module Lib
    ( someFunc
    , someJsFunc
    ) where

import Language.JavaScript.Inline

someFunc :: IO ()
someFunc = putStrLn "someFunc"


someJsFunc :: IO ()
someJsFunc = withSession defaultConfig
  \session  -> do
    val <- eval @JSVal session $ [js|
      return {
        a: 0,
        inc: function() {
          console.log('inc');
          this.a = this.a + 1;
        }
      } |]
    _   <- eval @JSVal session $ [js| $val.inc(); |]
    res <- eval @JSVal session $ [js| return $val.a; |]
    print res
