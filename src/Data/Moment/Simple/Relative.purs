-- | Relative date formatting, see http://momentjs.com/docs/#/displaying/fromnow/
module Data.Moment.Simple.Relative
  ( fromNow
  , fromNow'
  ) where

import Prelude

import Effect (Effect())
import Data.Function.Uncurried (Fn2(), runFn2)
import Data.Moment.Simple.Types (Moment())

foreign import fromNow_ :: Fn2 Moment Boolean (Effect String)

-- | Display the time as relative time with an "ago" suffix.
fromNow :: Moment -> Effect String
fromNow m = runFn2 fromNow_ m false

-- | Display the time as relative time *without* an "ago" suffix.
fromNow' :: Moment -> Effect String
fromNow' m = runFn2 fromNow_ m true
