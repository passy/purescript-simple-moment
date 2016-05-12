module Data.Moment.Simple.Internal
  ( isValid
  , clone
  ) where

import Data.Moment.Simple.Types (Moment())

-- | Verify that a moment is valid.
foreign import isValid :: Moment -> Boolean

-- | Should never have to be used explicitly, only
-- | used to make mutable things sane.
foreign import clone :: Moment -> Moment
