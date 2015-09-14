## Module Data.Moment.Simple.Relative

Relative date formatting, see http://momentjs.com/docs/#/displaying/fromnow/

#### `fromNow`

``` purescript
fromNow :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String
```

Display the time as relative time with an "ago" suffix.

#### `fromNow'`

``` purescript
fromNow' :: forall eff. Moment -> Eff (now :: Now, locale :: Locale | eff) String
```

Display the time as relative time *without* an "ago" suffix.


