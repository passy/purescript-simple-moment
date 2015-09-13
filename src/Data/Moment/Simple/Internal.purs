module Data.Moment.Simple.Internal where

import Data.Moment.Simple.Types (Moment())

-- | Verify that a moment is valid.
foreign import isValid :: Moment -> Boolean
