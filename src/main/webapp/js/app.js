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
        templateUrl: 'views/home.html',
        activetab: 'home'
    };

    var ratingState = {
        name: 'rating',
        url: '/rating/',
        templateUrl: 'views/rating.html',
        activetab: 'rating'
    };

    var restaurantState = {
        name: 'restaurant',
        url: '/restaurant',
        templateUrl: 'views/restaurant.html',
        activetab: 'restaurant'
    };

    var pathState = {
        name: 'path',
        url: '/path',
        templateUrl: 'views/path.html',
        activetab: 'path'
    };

    var testState = {
        name: 'test',
        url: '/test/',
        templateUrl: 'views/test.html',
        activetab: 'test'
    };

    $stateProvider.state(ratingState);
    $stateProvider.state(homeState);
    $stateProvider.state(restaurantState);
    $stateProvider.state(pathState);
    $stateProvider.state(testState);

    $urlRouterProvider.when('', '/home/');
});


