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
                    <li><span>Order Complete</span></li>
                </ul>

            </div>
        </div>

        <!-- hero image -->
        <div class="uk-section uk-section-muted">
            <div class="uk-container uk-container-small ">
                <h3>Order Complete</h3>
                <div class="uk-card uk-card-default  uk-width-1-1">
                    <div class="uk-grid" k-grid>
                        <div class="uk-width-2-3">
                            <div class="uk-card-body">
                                <table class="uk-table uk-table-striped">
                                    <caption>Order Summary</caption>

                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Price</th>


                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr id="{{book.id}}" class= "" ng-repeat="book in books">
                                            <td class="uk-text-bold">{{book.title}}  </td>
                                            <td class="uk-text-bold qvalue">{{book.count}}  </td>
                                            <td class="uk-text-primary qvalue">{{book.price}}</td>

                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="uk-width-1-3">
                            <div class="uk-container">

                                <p class="uk-text-center uk-margin-medium-top"><span ratio="1.5"  uk-icon="icon: credit-card"></span></p>
                                <h5 class="uk-text-center uk-margin-remove-top" >Order Total</h5> 
                                <h2 class="uk-text-center uk-margin-remove-top" >{{total}} <span class="uk-text-meta"> &dollar;</span></h2>
                                <div class="uk-card-footer uk-flex uk-flex-center">
                                    <div id="paypal-button-container" ></div> 
                                </div>



                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- section -->




    </div>
    <script
        src="https://www.paypal.com/sdk/js?client-id=AWRjZ6AVM5S5U_vwnjWbXyjpzRIZ-GXp5HA-T0IEzufSchjHjixT0-sSB0btoWTqyHCeSY_c9yQFkFnY">
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

    <script>
                                    const myApp = angular.module("myApp", []);
                                    myApp.controller("MainCtrl", ['$scope', '$http', mainCtrl]);
                                    function mainCtrl($scope, $http) {
                                        $scope.order = '-added';
                                        $scope.total = 0;

                                        let sum = 0;
                                        if (sessionStorage.getItem('toBuy')) {
                                            $scope.toBuy = sessionStorage.getItem('toBuy');

                                            let countItems = $scope.toBuy.split(",");
                                            document.getElementById("buyCount").innerText = countItems.length;
                                        }
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
                                        angular.forEach($scope.books, function (book) {

                                            sum += book.price * book.count;
                                        });
                                        $scope.total = sum;

                                        paypal.Buttons({
                                            createOrder: function (data, actions) {
                                                return actions.order.create({
                                                    purchase_units: [{
                                                            amount: {
                                                                value: $scope.total
                                                            }
                                                        }]
                                                });
                                            },
                                            onApprove: function (data, actions) {
                                                // Capture the funds from the transaction
                                                return actions.order.capture().then(function (details) {
                                                    // Show a success message to your buyer
                                                    alert('Transaction completed by ' + details.payer.name.given_name);
                                                });
                                            },
                                            onError: function (err) {
                                                alert('Somethin went wrong!');
                                            }
                                        }).render('#paypal-button-container');
                                    }
    </script>


</body>

</html>