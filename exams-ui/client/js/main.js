
// namespace

window.com ? 0 : window.com = {}, com.exams ? 0 : com.exams = {};

// angular service

// angular directive

angular.module('exams.directive', []).directive('ngReady', function () {
    return {
        link: function () {
            $(document).ready(function () {
                $(document).foundation();
            });
        }
    };
});

// angular controller

com.exams.MainCtrl = function ($scope, $location) {
    $scope.preventDefault = function ($event) {
        $event.preventDefault();
    }

    if ($location.path().length === 0) {
        $location.path('/home');
    }
};
com.exams.MainCtrl.$inject = ['$scope', '$location'];

com.exams.HomeCtrl = function ($scope) {
    console.log('HomeCtrl');
};
com.exams.HomeCtrl.$inject = ['$scope'];

com.exams.CreateExamsCtrl = function ($scope) {
    console.log('CreateExamsCtrl');
};
com.exams.CreateExamsCtrl.$inject = ['$scope'];

com.exams.ListExamsCtrl = function ($scope) {
    console.log('ListExamsCtrl');
};
com.exams.ListExamsCtrl.$inject = ['$scope'];

// angular app

com.exams.App = angular.module('exams', ['exams.directive'], 
    ['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {

        $routeProvider.when('/home', {
            templateUrl: '/html/home.html',
            controller: com.exams.HomeCtrl
        });
        
        $routeProvider.when('/exams/create', {
            templateUrl: '/html/exams-create.html',
            controller: com.exams.CreateExamsCtrl
        });

        $routeProvider.when('/exams/list', {
            templateUrl: '/html/exams-list.html',
            controller: com.exams.ListExamsCtrl
        });

        $locationProvider.html5Mode(false);
        $locationProvider.hashPrefix('!');
    }]
);
