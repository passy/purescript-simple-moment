# purescript-simple-moment

[![Greenkeeper badge](https://badges.greenkeeper.io/passy/purescript-simple-moment.svg)](https://greenkeeper.io/)

[![Latest release](http://img.shields.io/bower/v/purescript-simple-moment.svg)](https://github.com/passy/purescript-simple-moment/releases)
[![Build Status](https://travis-ci.org/passy/purescript-simple-moment.svg?branch=master)](https://travis-ci.org/passy/purescript-simple-moment)

> A minimal wrapper around a few hand-picked APIs of [moment.js](http://momentjs.com/).

For a more fully-featured library, check out
[purescript-moment](https://github.com/CapillarySoftware/purescript-moment).

## Example

```purs
tNow <- now
nowCal <- M.calendar $ M.fromDate tNow
print nowCal -- "Today at 9:47 PM"

nowStr <- M.fromNow $ M.fromDate tNow
print nowStr -- "a few seconds ago"
```

## Documentation

- [Data.Momemt.Simple](docs/Data/Moment/Simple.md)
- [Data.Moment.Simple.Relative](docs/Data/Moment/Simple/Relative.md)
- [Data.Moment.Simple.Types](docs/Data/Moment/Simple/Types.md)
- [Example](example/Main.purs)

## Motivation

While trying to port [purescript-moment](https://github.com/CapillarySoftware/purescript-moment),
to PureScript 0.7.4 I realized that most of the interfaces were obsolete now
that there are powerful abstractions for dates and times are available through
[purescript-datetime](https://github.com/purescript/purescript-datetime). Since
the remaining API almost had nothing in common with that of the original
library, I started to build a very small wrapper on my own.

## License

Apache-2
