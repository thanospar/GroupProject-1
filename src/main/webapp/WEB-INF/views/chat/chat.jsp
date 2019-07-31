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
            <span id="loggedName" style="display:none"><security:authorize access="isAuthenticated()"><security:authentication property="principal.username" /></security:authorize></span>
                <h1>Chat App</h1>
                <div ng-if="loggedname">
                    <h4>Wellcome {{loggedname}}</h4>
                    <div ng-if="notlogged === false">
                    <button ng-click="clearSessionName()">Exit</button>
                    </div>
                </div>
                <div ng-if="!loggedname">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Please enter your name and hit enter: </span>
                        </div>

                        <input ng-keypress="nameEntered($event)" class="form-control" type="text" id="getname"/>

                    </div>
                </div>
                <div ng-if="loggedname">
                <form:form method="POST" action="/GroupProject/chat/" modelAttribute="cmessage" >
                    <div class="input-group">
                        <form:input style="display:none" path="name" name="name" type="text" id="name" ng-model="loggedname" />
                        <div class="col-auto">
                        <form:select ng-change="selectChange($event)" path="subject" class="form-control" ng-model="subjectsel" id="subjectsel">
                            <form:option value="General" label="General"/>
                            <form:option value="Support" label="Support"/>
                            <form:option value="Sales" label="Sales"/>
                        </form:select>
                        </div>
                        <form:input path="message" name="message" type="text" id="message" class="form-control" placeholder="Type a new message"/>
                        <button class="btn btn-warning">Send</button>
                    </div>
                </form:form>
                <div id="messeges">
                    <div class="row m-2" ng-repeat="message in messages | filter:{subject:subjectsel}">
                        <div class="card bg-light shadow">
                            <div class="card-body">
                                <h6 class="card-subtitle">{{message.name}}:</h6>
                                <p class="card-text">{{message.message}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>

                    const myApp = angular.module("myApp", []);
                    myApp.controller("MainCtrl", ['$scope', '$http', mainCtrl]);
                    function mainCtrl($scope, $http) {
                        let inputName = document.querySelector("#getname");
                        let loggedName = document.querySelector("#loggedName").innerText;
                        $scope.subjectsel = "General";
                        if (loggedName) {
                            $scope.loggedname = loggedName;
                            $scope.notlogged = true;
                        } else if (sessionStorage.getItem('name')) {
                            $scope.loggedname = sessionStorage.getItem('name');
                            $scope.notlogged = false;
                        }
                        
                        if(sessionStorage.getItem('subject')){
                            $scope.subjectsel = sessionStorage.getItem('subject');
                        }
                        
                        $scope.nameEntered = function (keyEvent) {
                            if (keyEvent.which === 13 && keyEvent.currentTarget.value !== null)
                            {
                                $scope.loggedname = keyEvent.currentTarget.value
                                sessionStorage.setItem('name', keyEvent.currentTarget.value);
                                $scope.notlogged = false;
                            }

                        }
                        $scope.clearSessionName = function (keyEvent) {
                            sessionStorage.removeItem('name');
                            sessionStorage.removeItem('subject');
                            $scope.subjectsel = "General";
                            $scope.loggedname = null;
                        }
                        $scope.selectChange = function (event) {
                            let inputName2 = document.querySelector("#subjectsel");
                            $scope.subjectsel = inputName2.value;
                            sessionStorage.setItem('subject', inputName2.value);
                        }
                        $scope.messages =${messages};
                    }

        </script>
    </body>
</html>
