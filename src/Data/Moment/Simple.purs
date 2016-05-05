-- | A simple PureScript wrapper around moment.js
module Data.Moment.Simple
  ( fromDate
  , fromEpoch
  , calendar
  , module Data.Moment.Simple.Types
  , format
  , formatUTC
  , formatISO8601
  , formatUTCISO8601
  ) where

import Prelude

import Control.Monad.Eff (Eff())
import Control.MonadPlus (guard)
import Data.Date (Date(), Now())
import Data.Date.Locale (Locale)
import Data.Function (Fn2(), runFn2)
import Data.Maybe (Maybe())
import Data.Time (Milliseconds(..))

import Data.Moment.Simple.Internal (isValid, clone)
import Data.Moment.Simple.Types (Moment())

-- | Lift a valid date into a Moment object.
foreign import fromDate :: Date -> Moment

-- | Turn a Moment date into a human-readable string, e.g. "Today, 9:30pm"
foreign import calendar :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String

foreign import fromEpoch_ :: Number -> Moment

-- | Construct a Moment object from the milliseconds since
-- | 1970-01-01 00:00:00.000. If the timestamp is invalid, Nothing is returned.
fromEpoch :: Milliseconds -> Maybe Moment
fromEpoch (Milliseconds i) = do
  let m = fromEpoch_ i
  guard $ isValid m
  return m

foreign import formatISO8601_ :: Moment -> String

foreign import setUTC_ :: Moment -> Moment
foreign import format_ :: Fn2 String Moment String

setUTC :: Moment -> Moment
setUTC = clone >>> setUTC_

-- | Format with the given string, respecting the user's locale.
format :: forall eff. String -> Moment -> Eff (locale :: Locale | eff) String
format = (pure <<< _) <<< runFn2 format_

-- | Format according to ISO-8601, respecting the user's locale.
formatISO8601 :: forall eff. Moment -> Eff (locale :: Locale | eff) String
formatISO8601 = return <<< formatISO8601_

-- | Format with the given string, ignoring the locale timezone.
formatUTC :: String -> Moment -> String
formatUTC s m = runFn2 format_ s $ setUTC m

-- | Format according to ISO-8601, ignoring the locale timezone.
formatUTCISO8601 :: Moment -> String
formatUTCISO8601 = setUTC >>> formatISO8601_
