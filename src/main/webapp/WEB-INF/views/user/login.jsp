<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">


    </head>

    <body>
        <!-- nav bar -->
        <%@include file="../navigation.jsp" %>
        <!-- hero image -->
        <div class="uk-section uk-section-muted ">
            <div class="uk-container  ">
                <div class="uk-grid-divider uk-child-width-expand@s" uk-grid>
                    <div><h3 class="uk-text-center uk-margin-medium-bottom">Register</h3>
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
                                        
                                        <div class="uk-form-controls">
                                            <form:select path="userProfiles" style="display:none" items="${user.userProfiles}" multiple="true" itemValue="id" itemLabel="type" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="userProfiles" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text"></label>
                                        <div class="uk-form-controls">
                                        <input type="submit" value="Register" class="uk-button uk-button-primary"/> 
                                        </div>
                                    </div>



                                </form:form>
                    
                    
                    </div>

                    <div class="uk-width-1-2">
                        <h3 class="uk-text-center uk-margin-medium-bottom">Log in</h3>
                        <div class="uk-flex uk-flex-center">
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


                                    <input type="submit" class="uk-button uk-button-primary " value="Log in">
                                </div>
                            </div>

                        </form>
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
</body>

</html>