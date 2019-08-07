<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">
        <link href="<c:url value='/static/css/uikit.css' />" rel="stylesheet"></link>
        <link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
    </head>
    <body ng-app="myApp" ng-controller="MainCtrl" ng-cloak>
        <!-- nav bar -->
        <%@include file="navigation.jsp" %>
        <!-- hero image -->
        <div class="uk-position-relative uk-visible-toggle  " uk-height-viewport="offset-bottom: 20" tabindex="-1" uk-slideshow="ratio: false">
            <ul class="uk-slideshow-items" uk-height-viewport="min-height: 300">
                <li>
                    <img src="<c:url value='/static/images/50.jpg' />" alt="" uk-cover>
                    <div class="uk-position-center uk-position-small uk-text-center ">
                        <h2 class="uk-margin uk-heading-small">Welcome</h2>
                        <p class="uk-margin uk-text-lead">Find your book Now!</p>
                        <div class="uk-margin uk-padding-small">
                            <form action="/GroupProject/shop" class="uk-search uk-search-default">
                                <input class="uk-search-input" type="search" name="search" placeholder="Enter the Title">
                                <div> <button type="submit" class="uk-search-icon-flip search" uk-search-icon></button></div>
                            </form>
                        </div>
                        <a href="<c:url value='/shop' />"  class="uk-button uk-button-primary uk-text-capitalize">Continue to shop</a>
                    </div>
                </li>
            </ul>
        </div>
        <!-- section -->
        <div class="uk-section uk-section-default">
            <div class="uk-container">
                <h2 class=" uk-margin-bottom">Best seller</h2>
                <div uk-slider>
                    <div class="uk-position-relative">
                        <div class="uk-slider-container uk-dark">
                            
                            <ul class="uk-slider-items uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m">
                                <li ng-repeat="book in list ">
                                    <a href="<c:url value='/single-product-{{book.id}}' />" class=" ">
                                        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
                                             <div class="uk-card-badge uk-label uk-label-warning">Best Seller</div>
                                            <img class="product" src="<c:url value='/static/images/{{book.urlPath}}' />"  width="180" alt="" >
                                            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default ">
                                                <h4 class="uk-text-center uk-text-secondary uk-margin-small">{{book.title}}</h4>
                                                <p class=" uk-text-center uk-text-bold uk-text-lead uk-text-primary uk-margin-small">{{book.price}}€</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="uk-hidden@s uk-light">
                            <a class="uk-position-center-left uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                            <a class="uk-position-center-right uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                        </div>
                        <div class="uk-visible@s">
                            <a class="uk-position-center-left-out uk-position-small" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                            <a class="uk-position-center-right-out uk-position-small" href="#" uk-slidenav-next uk-slider-item="next"></a>
                        </div>
                    </div>
                    <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>
                </div>
            </div>
        </div>
        <div class="uk-section uk-section-muted">
            <div class="uk-container">
                <div class="uk-child-width-1-3@m uk-grid-small uk-grid-match" uk-grid>
                    <div>
                        <div class="uk-card uk-card-hover uk-card-body">
                            <h3 class="uk-card-title uk-margin  uk-text-center"><span class="uk-text-primary" ratio='1.8' uk-icon="icon: cart"></span>  Free delivery</h3>
                            <p class=" uk-text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-hover uk-card-body">
                            <h3 class="uk-card-title uk-margin uk-text-center"><span class="uk-text-primary" ratio='1.8' uk-icon="icon: credit-card"></span>  Pay with easy</h3>
                            <p class="uk-text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-hover uk-card-body ">
                            <h3 class="uk-card-title uk-margin uk-text-center"><span class="uk-text-primary" ratio='1.8' uk-icon="icon: tag"></span>  Best deal</h3>
                            <p class="uk-text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- footer -->
        <%@include file="footer.jsp" %>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

    <script>


                                                          const myApp = angular.module("myApp", []);
                                                          myApp.controller("MainCtrl", ['$scope', '$http', mainCtrl]);

                                                          function mainCtrl($scope, $http) {
                                                               $scope.books = ${booksArray};
                                                               
                                                               let listfiltered = $scope.books.filter(books => books.special === "Best Seller");
                                                              
                                                               $scope.list=listfiltered;
                                                              $scope.order = '-added';
                                                              if (sessionStorage.getItem('toBuy')) {
                                                                  $scope.toBuy = sessionStorage.getItem('toBuy');

                                                                  let countItems = $scope.toBuy.split(",");
                                                                  document.getElementById("buyCount").innerText = countItems.length;
                                                              } else {
                                                                  document.getElementById("buyCount").innerText = 0;
                                                              }


                                                          }
    </script>
</body>

</html>
