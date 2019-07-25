<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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

        <link href="<c:url value='/static/css/uikit.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/admin.css' />" rel="stylesheet"></link>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">


        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 




    </head>

    <body>
        <div>
            <!-- camvas -->
            <%@include file="camvas.jsp" %>
            <!-- main menu -->
            <div class="uk-grid uk-grid-collapse" uk-grid>
                <%@include file="authheader.jsp" %>	
                <!-- table -->

                <div class="uk-width-4-5 uk-width-expand@s admin">
                    <%@include file="adminHeader.jsp" %>
                    <div id="main" class="uk-section">
                        <div  class="uk-container">



                            <div class="uk-alert-success" uk-alert>
                                <a class="uk-alert-close" uk-close></a>
                                <p>${success}</p>
                            </div>

                            <span class="">
                                Go to <a href="<c:url value='/user/list' />">Users List</a>
                            </span>




                        </div>
                    </div>


                </div>

            </div>

        </div>

    </body>

</html>