define(function(require) {
	var $ = require('jquery');
	require('../common/cookie');
	var Home = require('./home');
	var h = new Home();
	h.render();
});