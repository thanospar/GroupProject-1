<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway:200,300,400,600,700,800&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                font-family: 'Raleway', sans-serif;
                margin: 0;
                padding: 0;
            }
            .container{
                width:920px;
                margin:0 auto;
                padding: 10px;
                background-color: lightblue;
            }
            .msg {
                background-color: tomato;
                border-radius: 16px;
                max-width: 200px;
                padding: 10px;
                margin: 10px;
            }
            .msg p{
                margin: 0;
            }
        </style>
    </head>
    <body ng-app="myApp" ng-controller="MainCtrl" ng-cloak>
        <div class="container">
            <security:authorize access="isAuthenticated()">
                Hello,   <security:authentication property="principal.username" /> 
            </security:authorize>
                <h1>Chat App</h1>
            <div class="msg" ng-repeat="message in messages">
                <p>{{message.message}}</p>
            </div>

            <form:form method="POST" action="/GroupProject/chat/" modelAttribute="cmessage" >
                <label for="name">Name</label>
                <form:input path="name" name="name" type="text" id="name" />
                <label for="message">Message</label>
                <form:input path="message" name="message" type="text" id="message" />
                <button>Send</button>
            </form:form>
        </div>
        <script>
                    const myApp = angular.module("myApp", []);
                    myApp.controller("MainCtrl", ['$scope', '$http', mainCtrl]);
                    function mainCtrl($scope, $http) {

                        $scope.messages =${messages};
                    }

        </script>
    </body>
</html>
