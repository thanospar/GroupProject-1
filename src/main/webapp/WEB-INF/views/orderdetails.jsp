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
                                            <th>Price</th>


                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr class= "" ng-repeat="book in books">
                                            <td class="uk-text-bold">{{book.title}}  </td>
                                            <td class="uk-text-primary">{{book.price}}</td>

                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="uk-width-1-3">
                            <div class="uk-container">

                                <p class="uk-text-center uk-margin-medium-top"><span ratio="1.5"  uk-icon="icon: credit-card"></span></p>
                                <h5 class="uk-text-center uk-margin-remove-top" >Order Total</h5> 
                                <h2 class="uk-text-center uk-margin-remove-top" >78.5 €</h2>
                                <div class="uk-card-footer uk-flex uk-flex-center">
                                   <a class="uk-button uk-button-primary ">Pay with Paypal</a> 
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
                                                    $scope.books = [
                                                        {
                                                            "id": 1,
                                                            "title": "Foundation",
                                                            "summary": "The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.",
                                                            "isbn": "9789604972661",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2011,
                                                            "urlPath": "foundation.jpg",
                                                            "price": 10,
                                                            "bookSeries": "Foundation",
                                                            "quantity": 11,
                                                            "authors": [
                                                                {
                                                                    "id": 1,
                                                                    "firstName": "Isaac",
                                                                    "lastName": "Asimov",
                                                                    "dateOfBirth": "1920-01-02",
                                                                    "dateOfDeath": "1992-04-06",
                                                                    "biography": "Isaac Asimov (/ˈaɪzᵻk ˈæzᵻmɒv/; born Isaak Yudovich Ozimov; circa January 2, 1920 - April 6, 1992) was an American author and professor of biochemistry at Boston University, best known for his works of science fiction and for his popular science books. Asimov was prolific and wrote or edited more than 500 books and an estimated 90,000 letters and postcards. His books have been published in 9 of the 10 major categories of the Dewey Decimal Classification.",
                                                                    "urlPath": "IssacAsimov.jpg"
                                                                }
                                                            ],
                                                            "categories": [
                                                                {
                                                                    "id": 2,
                                                                    "category": "Fantasy"
                                                                }
                                                            ],
                                                            "publisher": {
                                                                "id": 2,
                                                                "brand": "Anubis",
                                                                "info": "info about Anubis"
                                                            }
                                                        },
                                                        {
                                                            "id": 2,
                                                            "title": "Foundation and Empire",
                                                            "summary": "The Foundation series is Isaac Asimov s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The First Foundation survived two centuries of barbarism as the once-mighty Galactic Empire descended into chaos. Now it mist prepare for war against the remnants of the Empire as the Imperial fleet advances on their planet, Terminus. Hari Seldon predicted this war; he even prepared his Foundation for it. But he couldn t foresee the birth of the mutant Mule. In possession of a power which reduces fearsome opposition to devoted slaves, the Mule poses a terrible threat to Seldon s Foundation.",
                                                            "isbn": "9789604972661",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2012,
                                                            "urlPath": "foundationempire.jpg",
                                                            "price": 9,
                                                            "bookSeries": "Foundation",
                                                            "quantity": 22,
                                                            "authors": [
                                                                {
                                                                    "id": 1,
                                                                    "firstName": "Isaac",
                                                                    "lastName": "Asimov",
                                                                    "dateOfBirth": "1920-01-02",
                                                                    "dateOfDeath": "1992-04-06",
                                                                    "biography": "Isaac Asimov (/ˈaɪzᵻk ˈæzᵻmɒv/; born Isaak Yudovich Ozimov; circa January 2, 1920 - April 6, 1992) was an American author and professor of biochemistry at Boston University, best known for his works of science fiction and for his popular science books. Asimov was prolific and wrote or edited more than 500 books and an estimated 90,000 letters and postcards. His books have been published in 9 of the 10 major categories of the Dewey Decimal Classification.",
                                                                    "urlPath": "IssacAsimov.jpg"
                                                                }
                                                            ],
                                                            "categories": [
                                                                {
                                                                    "id": 2,
                                                                    "category": "Fantasy"
                                                                }
                                                            ],
                                                            "publisher": {
                                                                "id": 2,
                                                                "brand": "Anubis",
                                                                "info": "info about Anubis"
                                                            }
                                                        },
                                                      
                                                      
                                                       
                                                        {
                                                            "id": 6,
                                                            "title": "The Fall of Hyperion",
                                                            "summary": "The mysterious Time Tombs are opening and the Shrike that has risen from them may well control the fate of all mankind. The Ousters are laying seige to the Hegemony of Man and the AIs we created have turned against us to build the Ultimate Intelligence; God. The God of Machines. His genesis could mean annihilation for man. Something is drawing the hegemony, the Ousters, the AIs, the entire universe to the Shrike.",
                                                            "isbn": "9780575099487",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2012,
                                                            "urlPath": "hyperionfall.jpg",
                                                            "price": 15,
                                                            "bookSeries": "Hyperion Cantos",
                                                            "quantity": 19,
                                                            "authors": [
                                                                {
                                                                    "id": 3,
                                                                    "firstName": "Dan",
                                                                    "lastName": "Simmons",
                                                                    "dateOfBirth": "1948-04-04",
                                                                    "dateOfDeath": null,
                                                                    "biography": "Dan Simmons (born April 4, 1948) is an American science fiction and horror writer. He is the author of the Hyperion Cantos and the Ilium/Olympos cycles, among other works which span the science fiction, horror, and fantasy genres, sometimes within a single novel. A typical example of Simmons intermingling of genres is Song of Kali (1985), winner of the World Fantasy Award. He also writes mysteries and thrillers, some of which feature the continuing character Joe Kurtz.",
                                                                    "urlPath": "DanSimmons.jpg"
                                                                }
                                                            ],
                                                            "categories": [
                                                                {
                                                                    "id": 4,
                                                                    "category": "Science Fiction"
                                                                }
                                                            ],
                                                            "publisher": {
                                                                "id": 2,
                                                                "brand": "Anubis",
                                                                "info": "info about Anubis"
                                                            }
                                                        }
                                                       
                                                    ]


                                                }
</script>


</body>

</html>
