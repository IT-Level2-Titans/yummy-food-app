var app = angular.module('yummy', [
    'ngRoute',
    'ngMaterial',
    'ui.router',
    'angular-loading-bar',
    'ngMessages',
    'duScroll',
    'google.places',
    'ngMap',
    'ngAnimate',
]);


app.config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home');

    $stateProvider
        .state('home', {
            templateUrl: 'views/home.html',
            controller: 'homeController',
            url: '/home'
        })
        .state('restaurant', {
            templateUrl: 'views/restaurant.html',
            controller: 'restaurantController',
            url: '/restaurant'
        })
        .state('rating', {
            templateUrl: 'views/rating.html',
            controller: 'ratingController',
            url: '/rating'
        })
        .state('findus', {
            templateUrl: 'views/findus.html',
            controller: 'findusController',
            url: '/findus',
            params: {
                restaurant: undefined
            }
        })
        .state('register', {
            templateUrl: 'views/register.html',
            controller: 'registerController',
            url: '/register'
        })

        .state('aboutus', {
            templateUrl: 'views/aboutus.html',
            controller: 'AboutusController',
            url: '/register'
        })
});

