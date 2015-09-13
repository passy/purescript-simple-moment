## Module Data.Moment.Simple

A simple PureScript wrapper around moment.js

#### `fromDate`

``` purescript
fromDate :: Date -> Moment
```

Life a valid date into a Moment object.

#### `calendar`

``` purescript
calendar :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String
```

Turn a Moment date into a human-readable string, e.g. "Today, 9:30pm"

#### `fromEpoch`

``` purescript
fromEpoch :: Milliseconds -> Maybe Moment
```

Construct a Moment object from the milliseconds since
1970-01-01 00:00:00.000. If the timestamp is invalid, Nothing is returned.


