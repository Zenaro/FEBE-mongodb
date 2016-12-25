define(function(require) {
	var $ = require('jquery');
	require('../common/cookie');
	var Index = require('./homeMain');
	var i = new Index();
	i.render();
});