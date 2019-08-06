<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="<c:url value='/static/css/uikit.css' />" rel="stylesheet"></link>
<link href="https://fonts.googleapis.com/css?family=Arvo&display=swap" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
       
    </head>

    <body ng-app="myApp" ng-controller="MainCtrl" ng-cloak>
        <!-- nav bar -->
        <%@include file="../navigation.jsp" %>
        <!-- hero image -->
       
        <!-- section -->
        <div class="uk-section uk-section-muted">
            <div class="uk-container uk-container-small  ">

                <h2 class=" uk-margin-bottom">Chat  <span class="uk-text-primary" ratio="1.6" uk-icon="icon: users"></span>
</h2>
                
                    <div class="">
                        <div class="" style="background-color:#f8f8f8">


                            <span id="loggedName" style="display:none"><security:authorize access="isAuthenticated()"><security:authentication property="principal.username" /></security:authorize></span>

                                <div class="m-3" ng-if="loggedname">
                                    <p class="d-inline ">Hi! <span style="color: #306C48; text-transform: capitalize;">{{loggedname}}</span> </p>
                                    <div class="d-inline" ng-if="notlogged === false">
                                        <button class="btn ml-2 mb-1" style="background-color:grey; color:white;" ng-click="clearSessionName()">Exit</button>
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
                                    <div class="input-group  ">
                                        <form:input style="display:none" path="name" name="name" type="text" id="name" ng-model="loggedname" />
                                        <div class="">
                                            <form:select ng-change="selectChange($event)" path="subject" class="form-control" ng-model="subjectsel" id="subjectsel">
                                                <form:option value="General" label="General"/>
                                                <form:option value="Books" label="Books"/>
                                                <form:option value="Comics" label="Comics"/>
                                            </form:select>
                                        </div>
                                        <form:input path="message" name="message" type="text" id="message" class="form-control" ng-model="currentMsg" placeholder="Type a new message"/>
                                        <button style="background-color:#306C48; color:white;" class="btn">Send</button>
                                    </div>
                                    <hr>
                                    <div class=" chat"  >
                                </form:form>
                                <div id="messeges">

                                    <div ng-class="{ ' admin ':'{{message.name}}'=== '{{loggedname}}' }"  ng-repeat="message in messages| filter:{subject:subjectsel}">

                                        <div  ng-class="{ '  admin-color ':'{{message.name}}'=== '{{loggedname}}' }" class="width card  shadow m-1 ">
                                            <div class="card-body">
                                                <h6 class="card-subtitle">{{message.name}}:</h6>
                                                <p class="card-text">{{message.message}}</p>
                                            </div>
                                        </div>
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
 <script>
            const myApp = angular.module("myApp", []);
            myApp.controller("MainCtrl", ['$scope', '$interval', '$window', mainCtrl]);
            function mainCtrl($scope, $interval, $window) {

            let loggedName = document.querySelector("#loggedName").innerText;
            $scope.subjectsel = "General";
            if (loggedName) {
            $scope.loggedname = loggedName;
            $scope.notlogged = true;
            } else if (sessionStorage.getItem('name')) {
            $scope.loggedname = sessionStorage.getItem('name');
            $scope.notlogged = false;
            }
            if (sessionStorage.getItem('subject')) {
            $scope.subjectsel = sessionStorage.getItem('subject');
            }
            if (sessionStorage.getItem('msg')) {
            $scope.currentMsg = sessionStorage.getItem('msg');
            sessionStorage.removeItem('msg');
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

            $interval(function(){
            $scope.currentMsg = document.querySelector("#message").value;
            if ($scope.previewsMessage === $scope.currentMsg){
            console.log("idio prev me current");
            sessionStorage.setItem('msg', $scope.currentMsg);
            $window.location.replace("http://localhost:8080/GroupProject/chat/");
            }
            else if (!$scope.currentMsg){
            console.log("keno current");
            $window.location.replace("http://localhost:8080/GroupProject/chat/");
            }
            else{
            $scope.previewsMessage = $scope.currentMsg;
            console.log("den einai idia h keno");
            }

            }, 6000);
            $scope.messages =${messages};
            }
        </script>

   
</body>

</html>
