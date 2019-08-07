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


                </div>
            </div>
            <div class="uk-container ">
                <ul class="uk-breadcrumb">
                    <li><a href="<c:url value='/' />">Home</a></li>
                    <li><a href="<c:url value='/shop' />">Shop</a></li>
                    <li><span>Account</span></li>
                </ul>

            </div>
        </div>

        <!-- hero image -->
        <div class="uk-section uk-section-muted">
            <div class="uk-container uk-container-small ">
                <ul class="" uk-switcher="animation: uk-animation-fade" uk-tab>
                    <li><a href="#">Account</a></li>
                    <li><a href="#">Orders</a></li>

                </ul>

                <ul class="uk-switcher uk-margin">
                    <li>
                        <div class="uk-card uk-card-default uk-width-2-3@m">
                            <div class="uk-card-header">
                                <div class="uk-grid-small uk-flex-middle" uk-grid>
                                    <div class="uk-width-auto">
                                        <span class="uk-border-circle  uk-text-primary" width="40" height="40" uk-icon="user"></span>

                                    </div>
                                    <div class="uk-width-expand">
                                        <h3 class="uk-card-title uk-margin-remove-bottom">{{user.firstName}} {{user.lastName}}</h3>
                                        <p class="uk-text-meta uk-margin-remove-top"><time datetime="2016-04-01T19:00">April 01, 2016</time></p>
                                    </div>
                                </div>
                            </div>
                            <div class="uk-card-body">
                                <div uk-grid>
                                    <div>
                                        <h5 class="uk-text-primary">First Name</h5>
                                        <p>{{user.firstName}}</p>
                                        <h5 class="uk-text-primary">E-mail</h5>
                                        <p>{{user.email}}</p>
                                    </div>
                                    <div>
                                        <h5 class="uk-text-primary">Last Name</h5>
                                        <p>{{user.lastName}}</p>


                                    </div>
                                </div>
                            </div>
                            <div class="uk-card-footer">
                               <a href="<c:url value="/user/logout" />">Logout</a>
                            </div>
                        </div>

                    </li>
                    <li>
                        <div class="uk-card uk-card-default uk-width-2-3@m">
                            <div class="uk-card-header">
                                <div class="uk-grid-small uk-flex-middle" uk-grid>
                                    <div class="uk-width-auto">

                                        <h4 class="uk-card-title uk-margin-remove-bottom">Orders</h4>
                                    </div>
                                    <div class="uk-width-expand">


                                    </div>
                                </div>
                            </div>
                            <div class="uk-card-body">
                                <table class="uk-table">

                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <tr ng-repeat="book in books">
                                            <td>{{book.title}}</td>
                                            <td>{{book.count}}</td>
                                            <td>{{book.price}}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <div class="uk-card-footer">
                                <a href="<c:url value='/shop' />" class="uk-button uk-button-text">Continue Shopping</a>
                            </div>
                        </div>
                    </li>

                </ul>

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
                                            myApp.controller("MainCtrl", ['$scope', mainCtrl]);

                                            function mainCtrl($scope) {


                                                $scope.user = ${userObject};
                                                let booksArr = ${booksArray};
                                                booksArr.sort(function (a, b) {
                                                    return a.id - b.id;
                                                });
                                                let booksFinalList = [];

                                                for (let b of booksArr) {
                                                    if (booksFinalList.find(book => book.id === b.id)) {
                                                        let index = booksFinalList.findIndex(book => book.id === b.id);
                                                        booksFinalList[index].count += 1;
                                                    } else {
                                                        booksFinalList.push({id: b.id, urlPath: b.urlPath, price: b.price, title: b.title, quantity: b.quantity, count: 1});
                                                    }
                                                }
                                                $scope.books = booksFinalList;
                                            }
    </script>



</body>

</html>