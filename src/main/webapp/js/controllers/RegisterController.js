

(function () {
    'use strict';

    angular
        .module('yummy')
        .controller('registerController', registerController);

    registerController.$inject = ['$scope', 'registerService'];




    function registerController($scope , registerService ) {

        $scope.register = function () {
            registerService.registerRestaurant($scope.restaurant).then(function (data) {

                $scope.resonseResgistration = data ;

            });
        };

        $scope.uploadFile = function (files) {

            var reader = new FileReader();
            reader.readAsDataURL(files[0]);
            reader.onload = function () {
                $scope.restaurant = { image : reader.result };
            };

        }


    }

    //upload a photo


    app.controller('AppCtrl', ['$scope', '$mdSidenav', '$document', '$http', function($scope, $mdSidenav, $document, $http){


        $scope.toggleSidenav = function(menuId) {
            $mdSidenav(menuId).toggle();
        };

        $scope.upload = function(file) {
            console.log (file);
            if (file) {
                // create an object for the ids
                var pictureId;

                // create a new formdata to store our image
                var fd = new FormData();
                fd.append('photo', file);

                console.log (fd);

                // process the upload
                $http({
                    method: 'POST',
                    url: 'https://actorreels.stamplayapp.com/api/cobject/v1/pictures',
                    data: fd,
                    headers: { 'Content-Type': undefined },
                    photo: file
                }).then(function(response) {
                    console.log ("Upload Single Image to Stamplay successful!");
                    console.log (response);

                }, function(err){
                    console.log (err);
                });
            }


        }

        $scope.scroll = function(){

            var someElement = angular.element(document.getElementById('bottom'));
            var container   = angular.element(document.getElementById('container'));
            $scope.something = "clickeddd";
            container.scrollTo(someElement,0,1000);
        }

    }]);
})();

