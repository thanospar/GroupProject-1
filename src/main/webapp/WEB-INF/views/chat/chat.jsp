<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Raleway:200,300,400,600,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            body {
                font-family: 'Raleway', sans-serif;
            }
        </style>
    </head>
    <body ng-app="myApp" ng-controller="MainCtrl" ng-cloak>
        <div class="container bg-info p-1">
            <security:authorize access="isAuthenticated()">
                Hello,   <security:authentication property="principal.username" /> 
            </security:authorize>
            <h1>Chat App</h1>
            <form:form method="POST" action="/GroupProject/chat/" modelAttribute="cmessage" >
                <label for="name">Name</label>
                <form:input path="name" name="name" type="text" id="name" />
                <label for="message">Message</label>
                <form:input path="message" name="message" type="text" id="message" />
                <button>Send</button>
            </form:form>
            <div id="messeges">
                <div class="row m-1" ng-repeat="message in messages">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-subtitle">{{message.name}}:</h6>
                            <p class="card-text">{{message.message}}</p>
                        </div>
                    </div>
                </div>
            </div>
            
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
