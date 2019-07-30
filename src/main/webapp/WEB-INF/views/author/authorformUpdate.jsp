<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



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
                                <form:form method="POST" action="/GroupProject/authors/formUpdateAuthor" modelAttribute="author" class="uk-form-horizontal uk-margin" >
                                    <div class="uk-margin">
                                        <form:input type="hidden" path="id" id="id"/>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">First Name</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="firstName" id="firstName" class="uk-input"/>
                                            <div class="has-error">
                                                <form:errors path="firstName" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Last Name</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="lastName" id="lastName" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="lastName" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Date of birth</label>
                                        <div class="uk-form-controls">
                                            <form:input type="date" path="dateOfBirth" id="dateOfBirth" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="dateOfBirth" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Date of death</label>
                                        <div class="uk-form-controls">
                                            <form:input type="date" path="dateOfDeath" id="dateOfDeath" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="dateOfDeath" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Biography</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="biography" id="biography" class="uk-textarea" />
                                            <div class="has-error">
                                                <form:errors path="biography" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Image Url</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="urlPath" id="urlPath" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="urlPath" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
<!--                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Books</label>
                                        <div class="uk-form-controls">
                                            <form:select path="books" items="${books}" multiple="true" itemValue="id" itemLabel="title" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="books" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text"></label>
                                        <div class="uk-form-controls">
                                            <c:choose>
                                                <c:when test="${edit}">
                                                    <input type="submit" value="Update" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/authors/' />">Cancel</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="submit" value="Save" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/authors/' />">Cancel</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

