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
                            <div class="uk-card uk-card-default uk-card-body">
                                <div class="uk-padding-small   ">
                                    <h3 class="uk-card-title na">Add new</h3>
                                </div>
                                <form:form method="POST" modelAttribute="user" class="uk-form-horizontal uk-margin" >
                                    <div class="uk-margin">
                                        <form:input type="hidden" path="id" id="id"/></div>


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
                                        <label class="uk-form-label" for="form-horizontal-text">Sso ID</label>
                                        <div class="uk-form-controls">
                                            <c:choose>
                                                <c:when test="${edit}">
                                                    <form:input type="text" path="ssoId" id="ssoId" class="uk-input" disabled="true"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <form:input type="text" path="ssoId" id="ssoId" class="uk-input" />
                                                    <div class="has-error">
                                                        <form:errors path="ssoId" class="help-inline"/>

                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Password</label>
                                        <div class="uk-form-controls">
                                            <form:input type="password" path="password" id="password" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="password" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">E-mail</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="email" id="email" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="email" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Roles</label>
                                        <div class="uk-form-controls">
                                            <form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="userProfiles" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text"></label>
                                        <div class="uk-form-controls">
                                            <c:choose>
                                                <c:when test="${edit}">
                                                    <input type="submit" value="Update" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/list' />">Cancel</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="submit" value="Register" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/list' />">Cancel</a>
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
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
    </body>

</html>