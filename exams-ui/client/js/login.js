
// namespace

window.com ? 0 : window.com = {}, com.exams ? 0 : com.exams = {};

// angular service

// angular directive

angular.module('exams.directive', []).directive('ngKeyupEnter', function () {
    return {
        link: function ($scope, elem, attrs, ctrl) {
            var $elem = $(elem);
            $elem.keyup(function (event) {
                if (attrs && attrs.ngKeyupEnter && typeof $scope[attrs.ngKeyupEnter] === 'function' && event.keyCode === 13) {
                    $scope[attrs.ngKeyupEnter](event, elem);
                    $elem.blur();
                    $scope.$apply();
                }
            });
        }
    };
});

// angular app

com.exams.App = angular.module('exams-login', ['exams.directive']);

// angular controller

com.exams.LoginCtrl = function ($scope) {
    $scope.switchView = '';
    $scope.showLoader = false;

    $scope.$on('showSignUp', function () {
        $scope.$broadcast('removeSignUpStyle');
        $scope.switchView = 'switch-view';
    });

    $scope.$on('showSignIn', function () {
        $scope.switchView = '';
    });

    $scope.$on('showLoader', function () {
        console.log('showLoader');
        $scope.showLoader = true;
    });

    $scope.$on('hideLoader', function () {
        $scope.showLoader = false;
    });
};
com.exams.LoginCtrl.$inject = ['$scope'];

com.exams.SignInCtrl = function ($scope, $http, $location) {
    $scope.signInEmail = '';
    $scope.signInPass = '';
    $scope.signInEmailClass = '';
    $scope.signInPassClass = '';

    $scope.signIn = function ($event) {
        $event.preventDefault();
        var formValid = true;

        if ($scope.signInEmail.length === 0) {
            $scope.signInEmailClass = 'error';
            formValid = false;
        } else {
            $scope.signInEmailClass = '';
        }

        if ($scope.signInPass.length === 0) {
            $scope.signInPassClass = 'error';
            formValid = false;
        } else {
            $scope.signInPassClass = '';
        }

        if (formValid) {
            console.log('post login request');
            $scope.$emit('showLoader');
            $http({
                method: 'POST',
                url: '/login',
                data: { login: $scope.signInEmail, password: $scope.signInPass },
                headers: { 'Content-Type': 'application/json' }
            }).success(function () {
                console.log('login success');
                setTimeout(function () {
                    document.location = '/index.html';
                }, 1500);
            }).error(function () {
                console.log('login error');
                $scope.$emit('hideLoader');
            });
        }
    };

    $scope.onKeyUpEnter = function (event) {
        $scope.signIn(event);
    }

    $scope.forgotPass = function ($event) {
        $event.preventDefault();
    };

    $scope.showSignUp = function ($event) {
        $event.preventDefault();
        $scope.$emit('showSignUp');
    };
}
com.exams.SignInCtrl.$inject = ['$scope', '$http', '$location'];

com.exams.SignUpCtrl = function ($scope) {
    $scope.signUpStyle = { visibility: 'hidden' };
    $scope.signUpEmail = '';
    $scope.signUpPass = '';
    $scope.signUpEmailClass = '';
    $scope.signUpPassClass = '';

    $scope.signUp = function ($event) {
        $event.preventDefault();
        var formValid = true;

        if ($scope.signUpEmail.length === 0) {
            $scope.signUpEmailClass = 'error';
            formValid = false;
        } else {
            $scope.signUpEmailClass = '';
        }

        if ($scope.signUpPass.length === 0) {
            $scope.signUpPassClass = 'error';
            formValid = false;
        } else {
            $scope.signUpPassClass = '';
        }

        if (formValid) {
            console.log('form valid');
        }
    };

    $scope.$on('removeSignUpStyle', function () {
        $scope.signUpStyle = {};
    });

    $scope.showSignIn = function ($event) {
        $event.preventDefault();
        $scope.$emit('showSignIn');
    };
}
com.exams.SignUpCtrl.$inject = ['$scope'];
