/* global exports */
'use strict';

// module Data.Moment.Simple

var moment = require('moment');

exports.fromDate = function (a) {
  return moment(a);
};

exports.calendar = function (a) {
  return function () {
    return a.calendar();
  };
};

exports.fromEpoch_ = function (a) {
  return moment(a);
};

exports.formatISO8601_ = function (m) {
  return m.format();
};

exports.format_ = function (m, s) {
  return m.format(s);
};

exports.setUTC_ = function (m) {
  return m.utc();
};
