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

                        <input class="uk-search-input" type="search" placeholder="Enter the Title, Author, or ISBN" ng-model="titlesel">
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
                    <li><a href="<c:url value='/' />">Home</a></li>
                    <li><a href="<c:url value='/shop' />">Shop</a></li>
                    <li><span></span></li>
                </ul>

            </div>
        </div>

        <!-- hero image -->
        <div class="uk-section uk-section-muted">
            <div class="uk-container">
                <div class="uk-grid" uk-grid>
                    <div class="uk-width-2-3">
                        <form>

                            <table class="uk-table uk-table-striped cart-table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Title</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="{{book.id}}" class= "" ng-repeat="book in books">
                                        <td> <img class="product" src="<c:url value='/static/images/{{book.urlPath}}' />" class="img-cart" data-src="images/book3.jpg" width="70px"  alt=""
                                                  uk-img></td>
                                        <td class="">{{book.title}}</td>
                                        <td><input class="uk-input uk-form-width-xsmall qvalue" type="number" value="{{book.count}}"
                                                   min="1" max="{{book.quantity}}"></td>
                                        <td class="uk-text-bold qvalue">{{book.price}}</td>
                                        <td><a href="" style="color:red;" class="uk-align-center" uk-tooltip="Delete" ng-click="deleteRow($index)" uk-icon="icon: trash"></a></td>

                                    </tr>


                                </tbody>
                            </table>
                        </form>
                        <div class="uk-flex uk-flex-between  ">
                            <a href="<c:url value='/shop' />" class="uk-button uk-button-default"><span
                                    uk-icon="icon:  arrow-left"></span>Back to shop</a>
                            <button ng-click="quantRow()" class="uk-button uk-button-primary">Update cart</button>

                        </div>

                    </div>
                    <div class="uk-width-1-3 ">
                        <div class="" style="z-index: 980;" uk-sticky="offset: 100; bottom: #top">

                            <div>
                                <div class="uk-card uk-card-primary uk-card-body">
                                    <h3 class="uk-card-title">Cart Totals</h3>
                                    <table class="uk-table uk-table-divider">

                                        <tr class="">
                                            <td class="uk-text-bold uk-flex uk-flex-between">Subtotal</td>
                                            <td>{{total}} €</td>

                                        </tr>
                                        <tr>
                                            <td>Shipping</td>
                                            <td>Free</td>

                                        </tr>
                                        <tr>
                                            <td class="uk-text-bold">Total</td>
                                            <td class="uk-text-bold">{{total}}  €</td>

                                        </tr>
                                        </tbody>
                                    </table>
                                    <a href="<c:url value='/orderdetails/{{toBuy}}' />" class="uk-button uk-button-default">Procced to checkout <span
                                            uk-icon="icon:  arrow-right"></span></a>


                                    <!---->
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

<script>


                                                const myApp = angular.module("myApp", []);
                                                myApp.controller("MainCtrl", ['$scope', mainCtrl]);

                                                function mainCtrl($scope) {
                                                    $scope.order = '-added';
                                                    $scope.total = 0;

                                                    let sum = 0;


                                                    let countItems = sessionStorage.getItem('toBuy').split(",");

                                                    document.getElementById("buyCount").innerText = countItems.length;

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
                                                    $scope.toBuy = sessionStorage.getItem('toBuy');
                                                    $scope.quantRow = function () {


                                                        let qvalues = document.querySelectorAll(".qvalue");

                                                        Sum(qvalues);


                                                    };

                                                    function Sum(e) {
                                                        let totalsum = 0;
                                                        let buyList = "";
                                                        for (i = 0; i < e.length; i = i + 2) {

                                                            totalsum += e[i].value * e[i + 1].innerText;

                                                            const id = e[i].parentElement.parentElement.id;
                                                            let z;
                                                            for (z = 0; z < e[i].value; z++) {
                                                                buyList += id + ",";
                                                            }
                                                        }
                                                        sessionStorage.setItem('toBuy', buyList.slice(0, -1));
                                                        $scope.toBuy = buyList.slice(0, -1);
                                                        $scope.total = totalsum;
                                                    }



                                                    $scope.deleteRow = function (i) {
                                                        $scope.books.splice(i, 1);
                                                        let del = $scope.books[i].price;
                                                        //$scope.total = $scope.total-del;
                                                        $scope.quantRow();


                                                    };

                                                    angular.forEach($scope.books, function (book) {

                                                        sum += book.price * book.count;
                                                    });
                                                    $scope.total = sum;

                                                }
</script>


</body>

</html>
