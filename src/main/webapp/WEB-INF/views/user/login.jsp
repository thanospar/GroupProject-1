<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">


    </head>

    <body>
        <!-- nav bar -->
        <%@include file="../navigation.jsp" %>
        <!-- hero image -->
        <div class="uk-section uk-section-muted uk-section-xlarge login">
            <div class="uk-container uk-container-expand uk-align-center">
                <div class="uk-position-center uk-text-center uk-margin-top">
                    <c:url var="loginUrl" value="/user/login" />           
                    <form action="${loginUrl}" method="post" class="">
                        <c:if test="${param.error != null}">
                            <p>Invalid username and password.</p>

                        </c:if>
                        <c:if test="${param.logout != null}">
                            <div class="uk-alert-success" uk-alert>
                                <a class="uk-alert-close" uk-close></a>
                                <p>You have been logged out successfully.</p>
                            </div>
                        </c:if>

                        <div class="uk-margin ">
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: user"></span>

                                <input type="text" class="uk-input" id="username" name="ssoId" placeholder="Enter Username" required>
                            </div>
                        </div>

                        <div class="uk-margin">
                            <div class="uk-inline">
                                <span class="uk-form-icon uk-form-icon" uk-icon="icon: lock"></span>
                                <input type="password" class="uk-input" id="password" name="password" placeholder="Enter Password" required>
                            </div>
                        </div>
                        <div class="uk-margin">
                            <div class="uk-inline">

                                <input class="uk-checkbox" type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        <div class="uk-margin">
                            <div class="">


                                <input type="submit" class="uk-button uk-button-primary uk-width-1-1" value="Log in">
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>   



      
    </div>
</div>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.1.6/js/uikit-icons.min.js"></script> 
</body>

</html>