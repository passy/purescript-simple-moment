module Test.Main where

import Prelude
import Test.Unit

import Global (infinity)
import Data.Date (now)
import Data.Maybe (isJust, isNothing)
import Data.Time (Milliseconds(..))
import qualified Data.Moment.Simple as M
import qualified Data.Moment.Simple.Internal as M

main = do
  now' <- now
  runTest $ do
    test "valid" $ do
      assert "now is always valid" $
        M.isValid (M.fromDate now')

      assert "0 is valid" $
        isJust $ M.fromEpoch $ Milliseconds 0.0

      assert "∞ is invalid" $
        isNothing $ M.fromEpoch $ Milliseconds infinity
