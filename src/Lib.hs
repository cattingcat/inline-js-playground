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
          return this;
        }
      } |]
    a   <- eval @EncodedJSON session $ [js| return '' + $val.inc(); |]
    res <- eval @EncodedJSON session $ [js| return '' + $val.a; |]
    print a
    print res
