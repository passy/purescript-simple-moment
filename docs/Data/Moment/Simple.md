## Module Data.Moment.Simple

A simple PureScript wrapper around moment.js

#### `fromDate`

``` purescript
fromDate :: Date -> Moment
```

Lift a valid date into a Moment object.

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

#### `format`

``` purescript
format :: forall eff. String -> Moment -> Eff (locale :: Locale | eff) String
```

Format with the given string, respecting the user's locale.

#### `formatISO8601`

``` purescript
formatISO8601 :: forall eff. Moment -> Eff (locale :: Locale | eff) String
```

Format according to ISO-8601, respecting the user's locale.

#### `formatUTC`

``` purescript
formatUTC :: String -> Moment -> String
```

Format with the given string, ignoring the locale timezone.

#### `formatUTCISO8601`

``` purescript
formatUTCISO8601 :: Moment -> String
```

Format according to ISO-8601, ignoring the locale timezone.


