# purescript-simple-moment

[![Latest release](http://img.shields.io/bower/v/purescript-simple-moment.svg)](https://github.com/passy/purescript-simple-moment/releases)
[![Build Status](https://travis-ci.org/passy/purescript-simple-moment.svg?branch=master)](https://travis-ci.org/passy/purescript-simple-moment)

> A minimal wrapper around [moment.js](http://momentjs.com/).

- [Module documentation](docs/Data/Moment/Util.md)

## Motivation

While trying to port [purescript-moment](https://github.com/CapillarySoftware/purescript-moment),
to PureScript 0.7.4 I realized that most of the interfaces were obsolete now
that there are powerful abstractions for dates and times are available through
[purescript-datetime](https://github.com/purescript/purescript-datetime). Since
the remaining API almost had nothing in common with that of the original
library, I started to build a very small wrapper on my own.

## License

Apache-2
