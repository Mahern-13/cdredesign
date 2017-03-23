
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-sprockets
//= require_tree .
$(document).ready(function() {
  $(".trigger").click(function() {
    $(".menu").toggleClass("active"); 
  });
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus();
  });
  $(".share-more").click(function(){
    $(this).parent().addClass("expanded");
  });
  $(".share-less").click(function(){
    $(this).parent().removeClass("expanded");
  });
  $(".btn1").click(function(){
      $("p").slideUp();
  });
  $(".btn2").click(function(){
      $("p").slideDown();
  });
  

  angular.module("app", ["app.directives", "app.filters"]);

  function ShareCtrl($scope) {
    var url = "http://codepen.io";
    $scope.shares = {
      facebook: 1234,
      twitter: 5678,
      stumbleupon: 0
    };
    $.getJSON("http://graph.facebook.com/" + url, function(data) {
      $scope.shares.facebook = data.shares;
    });
    $.getJSON("http://cdn.api.twitter.com/1/urls/count.json?url=" + url + '&callback=?', function(data) {
      $scope.shares.twitter = data.count;
    });
    /*$.getJSON("http://www.stumbleupon.com/services/1.01/badge.getinfo?url=" + url + '&callback=?', function(data) {
      $scope.shares.stumbleupon = data.result.views;
    });*/
  };

  angular.module("app.directives", []);
  angular.module("app.filters", [])
  .filter("shortNumber", function () {
    return function (value) {
      if (value >= 1000000) {
        return Math.round(value/1000000) + "M";
      }
      if (value >= 1000) {
        return Math.round(value/1000) + "K";
      }
      return value;
    };
  });
});