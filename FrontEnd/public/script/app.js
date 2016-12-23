/**
 * Created by zenaro on 16-6-16.
 */
//设置configuration
seajs.config({
	base: "../Lib",
	alias: {
		"jquery": "jquery/jquery.js"
	}
});

seajs.use('../public/script/common/app'); //引入main.js
angular.module('routingApp', ['ngRoute'])
	.controller('indexCtrl', function($scope) {
		seajs.use('../public/script/home/homeIndex');
	})
	.controller('my', function($scope) {
		seajs.use('../public/script/my/myIndex');
	})
	.controller('result', function() {
		seajs.use('../public/script/result/resultIndex');
	})
	.controller('login', function() {
		seajs.use('../public/script/login/loginIndex');
	})
	.controller('reg', function() {
		seajs.use('../public/script/reg/regIndex');
	})
	.config(function($logProvider, $routeProvider) {
		$logProvider.debugEnabled(true);
		$routeProvider
			.when('/home', {
				templateUrl: 'home.html',
				controller: 'indexCtrl'
			})
			.when('/my', {
				templateUrl: 'my.html',
				controller: 'my'
			})
			.when('/result', {
				templateUrl: 'result.html',
				controller: 'result'
			})
			.when('/login', {
				templateUrl: 'login.html',
				controller: 'login'
			})
			.when('/reg', {
				templateUrl: 'reg.html',
				controller: 'reg'
			})
			.when('/upload', {
				templateUrl: 'upload.html'
			})
			.otherwise({
				redirectTo: '/home'
			});
	});