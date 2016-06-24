module Test.Main where

import Prelude
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit (test, suite)
import Test.Unit.Assert as Assert
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

import Global (infinity)
import Control.Monad.Eff.Now (now, NOW)
import Data.JSDate (LOCALE)
import Data.String (contains)
import Data.Maybe (isJust, isNothing, fromJust)
import Data.Time.Duration (Milliseconds(Milliseconds))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)

import Data.Moment.Simple as M
import Data.Moment.Simple.Relative as MR
import Data.Moment.Simple.Internal as MI

main :: forall eff. Eff ( now :: NOW
                        , locale :: LOCALE
                        , console :: CONSOLE
                        , testOutput :: TESTOUTPUT
                        | eff ) Unit
main = do
  now' <- now
  runTest $ do
    suite "basics" do
      test "validity" do
        Assert.assert "now is always valid" $ MI.isValid (M.fromDate now')
        Assert.assert "0 is valid" $ isJust $ M.fromEpoch $ Milliseconds 0.0
        Assert.assert "∞ is invalid" $ isNothing $ M.fromEpoch $ Milliseconds infinity

    suite "relative" do
      test "fromNow" do
        timeStr <- liftEff $ MR.fromNow $ M.fromDate now'
        Assert.assert "fromNow contains ago" $ "ago" `contains` timeStr

      test "fromNow'" do
        timeStr <- liftEff $ MR.fromNow' $ M.fromDate now'
        Assert.assertFalse "fromNow' doesn't contain ago" $ "ago" `contains` timeStr

    test "format" do
      let d = fromJust $ M.fromEpoch $ Milliseconds 0.0

      Assert.equal "1970-01-01T00:00:00Z" (M.formatUTCISO8601 d)
      Assert.equal "Thursday, January 1st 1970, 12:00:00 am" (M.formatUTC "dddd, MMMM Do YYYY, h:mm:ss a" d)
