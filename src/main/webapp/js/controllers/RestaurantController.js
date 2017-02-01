

(function () {
    'use strict';

    angular
        .module('yummy')
        .controller('restaurantController', restaurantController);

    restaurantController.$inject = ['$scope', 'restaurantService'];

    function restaurantController($scope , restaurantService ) {
        $scope.imagePath = 'images/hotel1.jpg';

            restaurantService.getAllRestaurants($scope.filters).then(function (data) {

                $scope.restuarentsAll = data ;

            });


        $scope.viewRestaurant = function (restaurant) {

            $state.go('findus' , {restaurant : restaurant} );

        }



    }


})();



