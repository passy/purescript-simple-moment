module Test.Main where

import Prelude
import Test.Unit (test, suite)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

import Effect (Effect())
import Effect.Class (liftEffect)
import Effect.Now (nowDate)
import Global (infinity)
import Data.String (contains)
import Data.String.Pattern (Pattern(Pattern))
import Data.Maybe (isJust, isNothing, fromJust)
import Data.Time.Duration (Milliseconds(Milliseconds))
import Partial.Unsafe (unsafePartial)

import Data.Moment.Simple as M
import Data.Moment.Simple.Relative as MR
import Data.Moment.Simple.Internal as MI

main :: Effect Unit
main = do
  now' <- nowDate
  runTest $ do
    suite "basics" do
      test "validity" do
        Assert.assert "now is always valid" $ MI.isValid (M.fromDate now')
        Assert.assert "0 is valid" $ isJust $ M.fromEpoch $ Milliseconds 0.0
        Assert.assert "∞ is invalid" $ isNothing $ M.fromEpoch $ Milliseconds infinity

    suite "relative" do
      test "fromNow" do
        timeStr <- liftEffect $ MR.fromNow $ M.fromDate now'
        Assert.assert "fromNow contains ago" $ Pattern "ago" `contains` timeStr

      test "fromNow'" do
        timeStr <- liftEffect $ MR.fromNow' $ M.fromDate now'
        Assert.assertFalse "fromNow' doesn't contain ago" $ Pattern "ago" `contains` timeStr

    test "format" do
      let d = unsafePartial $ fromJust $ M.fromEpoch $ Milliseconds 0.0

      Assert.equal "1970-01-01T00:00:00Z" (M.formatUTCISO8601 d)
      Assert.equal "Thursday, January 1st 1970, 12:00:00 am" (M.formatUTC "dddd, MMMM Do YYYY, h:mm:ss a" d)
