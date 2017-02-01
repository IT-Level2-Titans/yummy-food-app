

(function () {
    'use strict';

    angular
        .module('yummy')
        .controller('homeController', homeController);

    app.config(function ($mdThemingProvider) {
        $mdThemingProvider
            .theme('default')
            .primaryPalette('indigo')
            .accentPalette('pink')
            .warnPalette('red')
            .backgroundPalette('blue-grey');
    });

    homeController.$inject = ['$scope', 'homeService' ,'$state'];

    function homeController($scope , homeService , $state ) {

        $scope.searchResults = function () {
            homeService.getRestaurantsByFoodAndCity($scope.filters).then(function (data) {

                $scope.restuarents = data ;

            });


        };
        $scope.searchResults2 = function () {
            homeService.getRestaurantsByName($scope.filters).then(function (data) {

                $scope.restuarents2 = data ;

            });


        };

        $scope.searchResults3 = function () {
            homeService.getRestaurantsByLocation($scope.filters).then(function (data) {

                $scope.restuarents3 = data ;

            });


        };


        $scope.viewRestuarent = function (restaurant) {

            $state.go('findus' , {restaurant : restaurant} );

        };



        $scope.viewAllRestuarents = function () {

            $state.go('restaurant');

        };
        // $scope.searchCustomer = function () {
        //     customerSPService.searchCustomers($scope.search).then(function (state) {

        //         $scope.allCustomers = state;
        //     });
        // }
        //
        // $scope.viewContract = function (id) {
        //     $state.go('customerContracts', { id: id });
        // }
        //
        // $scope.adHocTicket = function (id) {
        //     $state.go('addServiceRequest', { customer: id })
        // }
    }
})();

