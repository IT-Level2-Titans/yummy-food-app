var app = angular.module('yummy', ['ui.router'])

app.controller('HomeController', HomeController)
        .controller('RatingController', RatingController)
        .controller('RestaurantController', RestaurantController)
        .controller('PathController', PathController)
        .controller('TestController', TestController);

app.config(function ($stateProvider, $urlRouterProvider) {

    var homeState = {
        name: 'home',
        url: '/home/',
        templateUrl: 'home.html',
        activetab: 'home'
    };

    var ratingState = {
        name: 'rating',
        url: '/rating/',
        templateUrl: 'rating.html',
        activetab: 'rating'
    };

    var restaurantState = {
        name: 'restaurant',
        url: '/restaurant',
        templateUrl: 'restaurant.html',
        activetab: 'restaurant'
    };

    var pathState = {
        name: 'path',
        url: '/path',
        templateUrl: 'path.html',
        activetab: 'path'
    };

    var testState = {
        name: 'test',
        url: '/test/',
        templateUrl: 'test.html',
        activetab: 'test'
    };

    $stateProvider.state(ratingState);
    $stateProvider.state(homeState);
    $stateProvider.state(restaurantState);
    $stateProvider.state(pathState);
    $stateProvider.state(testState);

    $urlRouterProvider.when('', '/home/');
});


