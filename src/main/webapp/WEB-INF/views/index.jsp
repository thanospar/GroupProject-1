<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    </head>

    <body>
        <!-- nav bar -->
        <div uk-sticky="media: 960" class="uk-navbar-container tm-navbar-container uk-sticky uk-active uk-sticky-fixed"
             style="position: fixed; top: 0px; width: 1265px;">
            <div class="uk-container uk-container-expand">
                <nav class="uk-navbar">
                    <div class="uk-navbar-center"><a href="" class="uk-navbar-item uk-logo"><img src="<c:url value='/static/images/booklogo.png' />" class="uk-margin-small-right" style="height:75px;">
                        </a></div>
                    <div class="uk-navbar-left">
                        <ul class="uk-navbar-nav">


                            <li> <a class="uk-navbar-toggle" uk-navbar-toggle-icon href="#" uk-toggle="target: #offcanvas-push" ></a>
                            </li>


                        </ul>

                    </div>
                    <div class="uk-navbar-right">
                        <ul class="uk-navbar-nav ">


                            <li><a href="<c:url value="/user/" />" uk-icon="icon: user"></a>
                            </li>
                            <li><a  href="<c:url value="/user/" />" uk-icon="icon: cart"></a>


                            </li>
                        </ul>

                    </div>
                </nav>
            </div>
        </div>
        <!-- hero image -->
        <div class="uk-position-relative uk-visible-toggle  " uk-height-viewport="offset-bottom: 20" tabindex="-1" uk-slideshow="ratio: false">

            <ul class="uk-slideshow-items" uk-height-viewport="min-height: 300">
                <li>
                    <img src="<c:url value='/static/images/50.jpg' />" alt="" uk-cover>
                    <div class="uk-position-center uk-position-small uk-text-center ">
                        <h2 class="uk-margin uk-heading-small">Welcome</h2>
                        <p class="uk-margin uk-text-lead">Find your book Now!</p>
                        <div class="uk-margin uk-padding-small">
                            <form action="/GroupProject/books" method="GET" class="uk-search uk-search-default">

                                <input class="uk-search-input" name="search" type="search" placeholder="Enter the Title, Author, or ISBN">
                                <div> <button type="submit" class="uk-search-icon-flip search" uk-search-icon></button></div>
                            </form>
                        </div>
                    </div>
                </li>

            </ul>


        </div>
        <!-- section -->
        <div id="offcanvas-push" uk-offcanvas="mode: push; overlay: true">
            <div class="uk-offcanvas-bar">

                <button class="uk-offcanvas-close" type="button" uk-close></button>

                <div class="uk-width-1-2@s">
                    <ul class="uk-nav-primary uk-nav-parent-icon" uk-nav>
                        <li class="uk-active"><a href="#"><span class="uk-margin-small-right" uk-icon="icon: home"></span>Home</a></li>
                        <li class="">
                            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: cart"></span>Shop</a>

                        </li>
                        <li class="">
                            <a href="#"><span class="uk-margin-small-right" uk-icon="icon: info"></span>About</a>

                        </li>
                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: receiver"></span>Contact</a></li>
                    </ul>
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

<script type="text/javascript"> $(document).ready(function () {
        $('#myTable').DataTable();
    });
</script>
</body>

</html>
