/* global exports */
'use strict';

// module Data.Moment.Simple.Relative

exports.fromNow_ = function (m, ago) {
  return function () {
    return m.fromNow(ago);
  }
};
