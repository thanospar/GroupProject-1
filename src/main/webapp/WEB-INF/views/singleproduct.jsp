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
</head>

<body>
    <!-- nav bar -->
    <%@include file="navigation.jsp" %>
<!-- hero image -->
   <div class="uk-section  uk-section-small uk-dark uk-background-cover"
        style="background-image: url()">
      
        <div class="uk-container ">
            <ul class="uk-breadcrumb">
                <li><a href="<c:url value='/' />">Home</a></li>
                <li><a href="<c:url value='/shop' />">Shop</a></li>
                <li><span>${book.title}</span></li>
            </ul>

        </div>
    </div>

    <!-- hero image -->
    <div class="uk-section  uk-section-small uk-section-muted">
            <div class="uk-container">
                    <div class="uk-child-width-expand@s" uk-grid>
                            <div class="uk-grid-item-match">
                                
                                        <div uk-lightbox>
                                                <a class="uk-align-center" href="<c:url value='/static/images/${book.urlPath}' />" data-caption="Ερωτας σαν τέχνη">
                                        <img class="uk-align-center" src="<c:url value='/static/images/${book.urlPath}' />" width="300px" height="" alt="" uk-img>
                                        </a>
                                </div>
                             </div>
                                      
                            <div>
                                <h2 class="singleheading  uk-text-primary uk-margin-medium " >${book.title}</h2>
                                <span class="uk-label uk-label-warning">Best seller</span>

                                <p class="uk-text-meta uk-margin-medium-bottom">${book.summary}</p>
                                <div class="uk-margin">
                                <ul class="uk-list">
                                        <li><span class="uk-text-bold">Author: </span>${book.authors[0].lastName} ${book.authors[0].firstName}</li>
                                        <li><span class="uk-text-bold">Publisher: </span>${book.publisher.brand}</li>
                                        <li><span class="uk-text-bold">ISBN: </span>${book.isbn}</li>
                                        <li><span class="uk-text-bold">Published Year: </span>${book.yearPublished}</li>
                                    </ul>
                                </div>
                                
                                <hr>
                                <div class="uk-margin">
                                    <a href="#" class="uk-button uk-button-primary"> <span class="uk-inline" uk-icon="cart"></span> Buy now </a>

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

        
</body>

</html>
