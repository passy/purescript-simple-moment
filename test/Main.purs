module Test.Main where

import Prelude (Unit, bind, ($), not)
import Test.Unit (test, suite)
import Test.Unit.Main (runTest)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Assert as Assert

import Global (infinity)
import Data.Date (Now(), now)
import Data.String (contains)
import Data.Maybe (isJust, isNothing)
import Data.Maybe.Unsafe (fromJust)
import Data.Time (Milliseconds(..))
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Unsafe (unsafeInterleaveEff)

import Data.Moment.Simple as M
import Data.Moment.Simple.Relative as M
import Data.Moment.Simple.Internal as M

main :: forall eff. Eff ( testOutput :: TESTOUTPUT
                        , now :: Now
                        | eff ) Unit
main = do
  now' <- now
  runTest $ do
    test "valid" $ do
      Assert.assert "now is always valid" $
        M.isValid (M.fromDate now')

      Assert.assert "0 is valid" $
        isJust $ M.fromEpoch $ Milliseconds 0.0

      Assert.assert "∞ is invalid" $
        isNothing $ M.fromEpoch $ Milliseconds infinity

    test "relative" $ do
      Assert.assert "fromNow contains ago" do
        timeStr <- unsafeInterleaveEff $ M.fromNow $ M.fromDate now'
        "ago" `contains` timeStr

      Assert.assert "fromNow' doesn't contain ago" do
        timeStr <- unsafeInterleaveEff $ M.fromNow' $ M.fromDate now'
        not $ "ago" `contains` timeStr

    test "format" $ do
      let d = fromJust $ M.fromEpoch $ Milliseconds 0.0

      Assert.equal (M.formatUTCISO8601 d) "1970-01-01T00:00:00+00:00"
      Assert.equal (M.formatUTC "dddd, MMMM Do YYYY, h:mm:ss a" d) "Thursday, January 1st 1970, 12:00:00 am"
