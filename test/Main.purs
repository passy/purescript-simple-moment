module Test.Main where

import Prelude
import Test.Unit
import Test.Unit.Console (TestOutput())

import Global (infinity)
import Data.Date (Now(), now)
import Data.String (contains)
import Data.Maybe (isJust, isNothing)
import Data.Maybe.Unsafe (fromJust)
import Data.Time (Milliseconds(..))
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Unsafe (unsafeInterleaveEff)
import qualified Data.Moment.Simple as M
import qualified Data.Moment.Simple.Relative as M
import qualified Data.Moment.Simple.Internal as M

main :: forall eff. Eff ( testOutput :: TestOutput
                        , now :: Now
                        | eff ) Unit
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

    test "relative" $ do
      assertFn "fromNow contains ago" $ \done -> do
        timeStr <- unsafeInterleaveEff $ M.fromNow $ M.fromDate now'
        done $ "ago" `contains` timeStr

      assertFn "fromNow' doesn't contain ago" $ \done -> do
        timeStr <- unsafeInterleaveEff $ M.fromNow' $ M.fromDate now'
        done $ not $ "ago" `contains` timeStr

    test "format" $ do
      assert "ISO-8601" $ do
        let d = fromJust $ M.fromEpoch $ Milliseconds 0.0
        M.formatUTCISO8601 d == "1970-01-01T00:00:00+00:00"

      assert "custom format" $ do
        let d = fromJust $ M.fromEpoch $ Milliseconds 0.0
        M.formatUTC "dddd, MMMM Do YYYY, h:mm:ss a" d == "Thursday, January 1st 1970, 12:00:00 am"
