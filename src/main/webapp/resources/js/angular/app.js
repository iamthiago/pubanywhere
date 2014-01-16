var pubanywhere = angular.module('pubanywhere', [
	 'ngRoute',
	 'homeController'
]);

	pubanywhere.config(['$routeProvider', function($routeProvider) {
		
		$routeProvider
			.when('/', {
				templateUrl : 'layout/home',
				controller : 'HomePubController'
			});
		
	}]);