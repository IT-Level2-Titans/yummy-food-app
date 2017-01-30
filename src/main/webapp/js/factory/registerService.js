/**
 * Created by Kasun Chinthaka on 1/25/2017.
 */
(function () {
    'use strict';

    angular
        .module('yummy')
        .factory('registerService', registerService);

    registerService.$inject = ['$http'];

    function registerService($http) {

        var webApi = "http://localhost:8080/rest/";


        var service = {
            registerRestaurant: registerRestaurant

        };

        return service;


        function registerRestaurant(filters) {
            return $http.get(webApi + 'foodservice/register?rname='+filters.restaurantName +'&uname='+filters.userName+'&pwd='+filters.password+'&ofac='+filters.orderingFacility+'&email='+filters.email+'&rconta='+filters.contactNumber+'&city='+filters.nearestCity+'&fooditems='+filters.availableFoodItems + '&location=' + filters.location.formatted_address + '&image=' + filters.image).then(handleSuccess, handleError('Error getting drivers'));
        }




        // UNDONE: Duplicate method on all services
        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    }
})();

