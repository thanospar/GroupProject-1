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

        <link href="<c:url value='/static/css/uikit.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/admin.css' />" rel="stylesheet"></link>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">


        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

        <script>$(document).ready(function () {
                $('#tbl').DataTable();
            });</script>   

    </head>

    <body>
        <div>
            <!-- camvas -->
            <%@include file="../user/camvas.jsp" %>
            <!-- main menu -->
            <div class="uk-grid uk-grid-collapse" uk-grid>
                <%@include file="../user/authheader.jsp" %>	
                <!-- table -->

                <div class="uk-width-4-5 uk-width-expand@s admin">
                    <%@include file="../user/adminHeader.jsp" %>
                    <div id="main" class="uk-section">
                        <div  class="uk-container">
                            <h3 class="uk-card-title na">Authors</h3>

                            <div class="uk-card uk-card-default uk-card-body">
                                <div class=" uk-padding-small ">
                                    <a href="<c:url value='formAddAuthor' />"  class="uk-button uk-button-secondary  "  uk-toggle>Add new</a>

                                </div>
                                <table id="tbl" class="uk-table uk-table-hover uk-table-divider">
                                    <thead>
                                        <tr>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Date of Birth</th>
                                            <th>Date of Death</th>
                                            <th>Biography</th>
                                            <th>Image Url</th>
                                            <th></th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${authors}" var="author">
                                            <tr>
                                                <td>${author.firstName}</td>
                                                <td>${author.lastName}</td>
                                                <td>${author.dateOfBirth}</td>
                                                <td>${author.dateOfDeath}</td>
                                                <td><div class="uk-overflow-auto uk-height-max-small" >${author.biography}</div></td>
                                                <td>${author.urlPath}</td>

                                                <td><a href="<c:url value='formUpdateAuthor/${author.id}' />" style="color:green;" class="uk-align-center" uk-tooltip="Edit" uk-icon="icon: pencil"></a></td>  
                                                <td><a href="<c:url value='deleteAuthor/${author.id}' />" style="color:red;" class="uk-align-center" uk-tooltip="Delete" uk-icon="icon: trash"></a></td>
                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                </table>

                            </div>    


                        </div>
                    </div>


                </div>

            </div>

        </div>

    </body>

</html>
