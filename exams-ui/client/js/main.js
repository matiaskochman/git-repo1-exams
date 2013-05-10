
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

// angular app

com.exams.App = angular.module('exams', ['exams.directive']);

// angular controller

com.exams.MainCtrl = function ($scope) {
    $scope.preventDefault = function ($event) {
        $event.preventDefault();
    }
};
com.exams.MainCtrl.$inject = ['$scope'];
