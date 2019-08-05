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
                <li ng-repeat="book in books | filter :{title:titlesel, categories :{ category : categorysel }, authors :{ lastName : authorsel }}">
                   <a href="<c:url value='/single-product-{{book.id}}' />" class=" ">
                                            <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
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



        <div class="uk-section uk-section-primary uk-light">
            <div class="uk-container">



                <div class="uk-grid-match uk-child-width-1-4@m" uk-grid>
                    <div>

                        <ul class="uk-nav uk-nav-default uk-nav-center">
                            <li class="uk-nav-header"><span uk-icon="icon:  info"></span> Information</li>
                            <li class="uk-nav-divider"></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Customer Service</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Search Terms</a></li>
                        </ul>

                    </div>
                    <div>
                        <ul class="uk-nav uk-nav-default uk-nav-center">
                            <li class="uk-nav-header"><span uk-icon="icon: users"></span> My Account</li>
                            <li class="uk-nav-divider"></li>
                            <li><a href="#">Sign In</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">My Orders</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <div>
                        <ul  class="uk-nav uk-nav-default  uk-nav-parent-icon uk-nav-center ">
                            <li class="uk-nav-header"><span uk-icon="icon: social"></span> Keep in touch</li>
                            <li class="uk-nav-divider"></li>
                            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: facebook"></span> Facebook</a></li>
                            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: instagram"></span> Instagram</a></li>
                            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: twitter"></span> Twitter</a></li>
                            <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: google"></span> Google</a></li>


                        </ul>
                    </div>
                    <div>
                        <ul  class="uk-nav uk-nav-default  uk-nav-parent-icon uk-nav-center ">
                            <li><img class="uk-align-center " data-src="<c:url value='/static/images/booklogowhite.png' />" width="131" height="100" alt="" uk-img> </li>
                            


                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <div class="uk-section uk-section-secondary uk-section-xsmall uk-light">
            <div class="uk-container uk-flex uk-flex-center">

                <div>
                    <p class="uk-text-meta uk-margin-remove">2019 © BoookGarden. All Rights Reserved</p>
                </div>



            </div>
        </div>







    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 


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
                                                            "id": 3,
                                                            "title": "Second Foundation",
                                                            "summary": "The Foundation series is Isaac Asimov’s iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldon’s two Foundations is a lasting testament to an extraordinary imagination, one whose unprecedented scale shaped science fiction as we know it today. The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate. Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy. However, the death throes of the Empire breed hostile new enemies, and the young Foundation’s fate will be threatened first.",
                                                            "isbn": "9789604972661",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2014,
                                                            "urlPath": "secondfoundation.jpg",
                                                            "price": 11,
                                                            "bookSeries": "Foundation",
                                                            "quantity": 13,
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
                                                            "id": 4,
                                                            "title": "Weaveworld",
                                                            "summary": "Reissue of the highly acclaimed thriller by the world’s most outstanding dark fantasist. WEAVEWORLD is an epic adventure of the imagination. It begins with a carpet in which a world of rapture and enchantment is hiding; a world which comes to life, alerting the dark forces and beginning a desperate battle to preserve the last vestiges of magic which Humankind still has access to. WEAVEWORLD is a book of visions and horrors, a story of quest, titanic struggles, of love and of hope. It is a triumph of imagination and storytelling, an adventure, a nightmare, a promise… ‘Barker’s fecundity of invention is beyond praise. In a world of hard-bitten horror and originality, Clive Barker dislocates your mind.’ THE MAIL ON SUNDAY.",
                                                            "isbn": "978-960-620-453-1",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2009,
                                                            "urlPath": "weaveworld.jpg",
                                                            "price": 18,
                                                            "bookSeries": null,
                                                            "quantity": 46,
                                                            "authors": [
                                                                {
                                                                    "id": 2,
                                                                    "firstName": "Clive",
                                                                    "lastName": "Barker",
                                                                    "dateOfBirth": "1952-10-05",
                                                                    "dateOfDeath": null,
                                                                    "biography": "Barker is an author of horror/fantasy. He began writing horror early in his career, mostly in the form of short stories (collected in Books of Blood 1–6) and the Faustian novel The Damnation Game (1985). Later he moved towards modern-day fantasy and urban fantasy with horror elements in Weaveworld (1987), The Great and Secret Show (1989), the world-spanning Imajica (1991), and Sacrament (1996). When Books of Blood were first published in the United States in paperback, Stephen King was quoted on the book covers: \"I have seen the future of horror and his name is Clive Barker.\"[5] As influences on his writing, Barker lists Herman Melville, Edgar Allan Poe, Ray Bradbury, William S. Burroughs, William Blake, and Jean Cocteau, among others. He is the writer of the best-selling Abarat series, and plans on producing two more novels in the series.",
                                                                    "urlPath": "CliveBarker.jpg"
                                                                }
                                                            ],
                                                            "categories": [
                                                                {
                                                                    "id": 3,
                                                                    "category": "Horror"
                                                                }
                                                            ],
                                                            "publisher": {
                                                                "id": 3,
                                                                "brand": "BELL",
                                                                "info": "info about BELL"
                                                            }
                                                        },
                                                        {
                                                            "id": 5,
                                                            "title": "Hyperion",
                                                            "summary": "It is the 29th century and the universe of the Human Hegemony is under threat. Invasion by the warlike Ousters looms, and the mysterious schemes of the secessionist AI TechnoCore bring chaos ever closer. On the eve of disaster, with the entire galaxy at war, seven pilgrims set fourth on a final voyage to the legendary Time Tombs on Hyperion, home to the Shrike, a lethal creature, part god and part killing machine, whose powers transcend the limits of time and space. The pilgrims have resolved to die before discovering anyhting less than the secrets of the universe itself.",
                                                            "isbn": "9780575076372",
                                                            "cover": "Paperback",
                                                            "yearPublished": 2005,
                                                            "urlPath": "hyperion.jpg",
                                                            "price": 14,
                                                            "bookSeries": "Hyperion Cantos",
                                                            "quantity": 13,
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
                                                        },
                                                        {
                                                            "id": 7,
                                                            "title": "yyyyyyyy",
                                                            "summary": "yyyyyyyyyy",
                                                            "isbn": "yyyyyyyyyyyyyy",
                                                            "cover": "Paperback",
                                                            "yearPublished": 1902,
                                                            "urlPath": "yyyyyyyyyyyyyyy",
                                                            "price": 3,
                                                            "bookSeries": "yyyyyyyyyyyyy",
                                                            "quantity": 3,
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
                                                                    "id": 3,
                                                                    "category": "Horror"
                                                                },
                                                                {
                                                                    "id": 2,
                                                                    "category": "Fantasy"
                                                                }
                                                            ],
                                                            "publisher": {
                                                                "id": 1,
                                                                "brand": "Dioptra",
                                                                "info": "info about Dioptra"
                                                            }
                                                        }
                                                    ]


                                                }
</script>
</body>

</html>
