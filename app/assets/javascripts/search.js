const app = angular.module('stickr', ['ngSanitize']);

/**
 * Defines access to the end points for retrieving results via javascript.
 */
app.factory('SearchService', ['$http', function($http) {
  const search = function(text) {
    console.log("Searching for: " + text);
    return $http.get('/search?q=' + encodeURIComponent(text));
  };
  const photo = function(id) {
    console.log("Getting info for: " + id);
    return $http.get('/photo/' + id);
  }
  return {
    search: search
  };
}]);

app.controller('SearchController', ['$scope', '$sce', 'SearchService', function($scope, $sce, svc) {

  $scope.text = "";
  $scope.results = [];

  $scope.search = function() {
    svc.search($scope.text).then(function(response) {
      console.log("Search done. Loading results...");
      $scope.results = response.data.map(function(item) { 
        return svc.photo(item);
      });
    });
  }
}]);