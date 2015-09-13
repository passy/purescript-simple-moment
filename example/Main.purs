-- Run with:
-- pulp build -I example && pulp run -m Example.Main
module Example.Main where

import Prelude
import Control.Monad.Eff.Console
import Data.Date
import Data.Time
import Data.Maybe

import Data.Moment.Simple

main = do
  tNow <- now
  nowCal <- calendar $ fromDate tNow
  print nowCal -- "Today at 9:47 PM"
  -- let tThen = fromStringStrict "2015-09-13T20:56:22.001Z"
