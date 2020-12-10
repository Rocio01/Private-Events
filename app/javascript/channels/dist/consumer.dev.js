"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _actioncable = require("@rails/actioncable");

// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
var _default = (0, _actioncable.createConsumer)();

exports["default"] = _default;

function DisableButton(b) {
  b.disabled = true;
  b.value = 'Submitting';
  b.form.submit();
}