

(function () {
    'use strict';

    angular
        .module('yummy')
        .controller('findusController', findusController);


    findusController.$inject = ['$scope', 'findusService' , '$stateParams'];

    function findusController($scope , findusService , $stateParams ) {
        $scope.imagePath = 'images/hotel2.jpg';

        $scope.restaurant = $stateParams.restaurant;

        $scope.user = {
            name: 'John Doe',
            email: '',
            phone: '',
            address: 'Mountain View, CA',
            donation: 19.99
        };

        $scope.filters = {
            currentLocation : undefined ,
            destination :undefined
        }


        $scope.showPath = function () {
            $scope.filters.currentLocation = $scope.currentLocation.formatted_address;
            $scope.filters.destination = $scope.restaurant.Location;
        };



    }
})();

