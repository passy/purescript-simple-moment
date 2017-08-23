-- | Relative date formatting, see http://momentjs.com/docs/#/displaying/fromnow/
module Data.Moment.Simple.Relative
  ( fromNow
  , fromNow'
  ) where

import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Now (NOW)
import Data.JSDate (LOCALE)
import Data.Function.Uncurried (Fn2(), runFn2)
import Data.Moment.Simple.Types (Moment())

foreign import fromNow_ :: forall eff.
  Fn2 Moment Boolean (Eff (now :: NOW, locale :: LOCALE | eff) String)

-- | Display the time as relative time with an "ago" suffix.
fromNow :: forall eff. Moment -> Eff (now :: NOW, locale :: LOCALE | eff) String
fromNow m = runFn2 fromNow_ m false

-- | Display the time as relative time *without* an "ago" suffix.
fromNow' :: forall eff. Moment -> Eff (now :: NOW, locale :: LOCALE | eff) String
fromNow' m = runFn2 fromNow_ m true
