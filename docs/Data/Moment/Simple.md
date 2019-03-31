## Module Data.Moment.Simple

A simple PureScript wrapper around moment.js

#### `fromDate`

``` purescript
fromDate :: Date -> Moment
```

Lift a valid date into a Moment object.

#### `fromEpoch`

``` purescript
fromEpoch :: Milliseconds -> Maybe Moment
```

Construct a Moment object from the milliseconds since
1970-01-01 00:00:00.000. If the timestamp is invalid, Nothing is returned.

#### `calendar`

``` purescript
calendar :: Moment -> Effect String
```

Turn a Moment date into a human-readable string, e.g. "Today, 9:30pm"

#### `format`

``` purescript
format :: String -> Moment -> Effect String
```

Format with the given string, respecting the user's locale.

#### `formatUTC`

``` purescript
formatUTC :: String -> Moment -> String
```

Format with the given string, ignoring the locale timezone.

#### `formatISO8601`

``` purescript
formatISO8601 :: Moment -> Effect String
```

Format according to ISO-8601, respecting the user's locale.

#### `formatUTCISO8601`

``` purescript
formatUTCISO8601 :: Moment -> String
```

Format according to ISO-8601, ignoring the locale timezone.


### Re-exported from Data.Moment.Simple.Types:

#### `Moment`

``` purescript
data Moment :: Type
```
