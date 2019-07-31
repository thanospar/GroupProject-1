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

        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
    </head>

    <body ng-app="myApp" ng-controller="MainCtrl" ng-cloak>
        <!-- nav bar -->
        <%@include file="navigation.jsp" %>
        <!-- hero image -->
        <div class="uk-section uk-section-small uk-dark uk-background-cover"
             style="background-image: url(<c:url value='/static/images/3584.jpg' />)">
            <div class="uk-container uk-text-center">
                <div class="uk-margin uk-padding-small">
                    <h3></h3>
                    <form action=""
                          class="uk-search uk-search-default">

                        <input class="uk-search-input" type="search" placeholder="Enter the Title, Author, or ISBN">
                        <div> <button type="submit" class="uk-search-icon-flip search uk-icon uk-search-icon"
                                      uk-search-icon=""><svg width="20" height="20" viewBox="0 0 20 20"
                                                   xmlns="http://www.w3.org/2000/svg" data-svg="search-icon">
                                <circle fill="none" stroke="#000" stroke-width="1.1" cx="9" cy="9" r="7"></circle>
                                <path fill="none" stroke="#000" stroke-width="1.1" d="M14,14 L18,18 L14,14 Z"></path>
                                </svg></button></div>
                    </form>
                </div>

            </div>
            <div class="uk-container ">
                <ul class="uk-breadcrumb">
                    <li><a href="">Home</a></li>
                    <li><a href="">Shop</a></li>
                    <li><span></span></li>
                </ul>

            </div>
        </div>

        <!-- hero image -->
        <div class="uk-section uk-section-muted">
            <div class="uk-container">
                <div class="uk-grid" uk-grid>
                    <div class="uk-width-1-4 ">
                        <h4><span uk-ratio="1.5" uk-icon="icon: settings"></span> Filters</h4>
                        <div class="" style="z-index: 980;" uk-sticky="offset: 80; bottom: #top">
                            <form class="uk-form-stacked">
                                 <div class="uk-margin">
                                    <label class="uk-form-label" for="form-stacked-select">Search by Title </label>
                                    <div class="uk-form-controls">
                                        <input class="uk-input" type="text" id="searchall" ng-model="titlesel">
                                    </div>
                                </div>


                                <div class="uk-margin">
                                    <label class="uk-form-label" for="form-stacked-select">Select Category</label>
                                    <div  class="uk-form-controls">
                                        <label><input  ng-model="categorysel" value="" class="uk-radio" type="radio" name="radio1"> All</label><br>
                                        <label><input  ng-model="categorysel" value="Fantasy" class="uk-radio" type="radio" name="radio1"> Fantasy</label><br>
                                         <label><input  ng-model="categorysel" value="Horror" class="uk-radio" type="radio" name="radio1"> Horror</label><br>
                                         <label><input  ng-model="categorysel" value="Science Fiction" class="uk-radio" type="radio" name="radio1"> Science Fiction</label>
                                    </div>
                                </div>
                                <div class="uk-margin">
                                    <label class="uk-form-label" for="form-stacked-select">Select Author</label>
                                    <div class="uk-form-controls">
                                           <label><input  ng-model="authorsel" value="" class="uk-radio" type="radio" name="radio1"> All</label><br>
                                        <label><input  ng-model="authorsel" value="Asimov" class="uk-radio" type="radio" name="radio1"> Asimov</label><br>
                                         <label><input  ng-model="authorsel" value="Barker" class="uk-radio" type="radio" name="radio1"> Barker</label><br>
                                         <label><input  ng-model="authorsel" value="Simmons" class="uk-radio" type="radio" name="radio1"> Simmons </label>
                                       
                                    </div>
                                </div>
                               
                               

                            </form>



                        </div>
                    </div>
                    <div class="uk-width-3-4">
                        <!-- button -->
                        <form class="uk-grid-small" uk-grid>

                            <div class="uk-width-1-4@s ">
                                <select ng-model="order" class="uk-select uk-form-small" >
                                    <option value="-added">Recently Added</option>
            <option value="price">Price (low to high)</option>
            <option value="-price">Price (high to low)</option>
            <option value="title">Name A-Z</option>
            <option value="-title">Name Z-A</option>
                                </select>
                            </div>
                        </form>
                        <!-- card -->
                        <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center " uk-grid>
                            <div  ng-repeat="book in books| filter :{title:titlesel, categories :{ category : categorysel }, authors :{ lastName : authorsel }}  | orderBy: order">
                                
                                <div>
                                    <div
                                        class="uk-card uk-card-default uk-card-hover uk-card-body uk-padding-remove-horizontal">
                                        <a href="<c:url value='/single-product-{{book.id}}' />" class=" ">
                                            <img class="product" src="<c:url value='/static/images/{{book.urlPath}}' />"  width="125" alt="" uk-img></a>
                                        <h4 class="product-title uk-text-secondary uk-margin-small	">{{book.title}}</h4>
                                        <p class="product-author uk-text-meta uk-margin-small">Author: {{book.authors[0].firstName}} {{book.authors[0].lastName}}</p>
                                        <p class="product-author uk-text-meta uk-margin-small">Year: {{book.yearPublished}} </p>

                                        <div class="uk-button-group">
                                            <button class="uk-button uk-button-secondary">{{book.price}}€</button>
                                            <a href="<c:url value='/single-product-{{book.id}}' />"  class="uk-button uk-button-primary">Buy now</a>

                                        </div>
                                    </div>
                                </div>


                                        </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>


        </div>
    </div>
    <!-- section -->




</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

<script>


                                                const myApp = angular.module("myApp", []);
                                                myApp.controller("MainCtrl", ['$scope', '$http', mainCtrl]);

                                                function mainCtrl($scope, $http) {
                                                     $scope.order = '-added';
                                                    $scope.books = ${booksArray};


                                                }
</script>
</script>

</body>

</html>
