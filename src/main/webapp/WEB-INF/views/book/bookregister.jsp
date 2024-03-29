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
                            <h3 class="uk-card-title na">Books</h3>

                            <div class="uk-card uk-card-default uk-card-body">
                                <form:form method="POST" action="/GroupProject/books/formAddBook" modelAttribute="book" class="uk-form-horizontal uk-margin" >
                                    <div class="uk-margin">
                                        <form:input type="hidden" path="id" id="id"/>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Title</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="title" id="title" required="required" class="uk-input"/>
                                            <div class="has-error">
                                                <form:errors path="title" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Summary</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="summary" id="summary" class="uk-textarea" />
                                            <div class="has-error">
                                                <form:errors path="summary" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">ISBN</label>
                                        <div class="uk-form-controls">
                                            <form:input type="text" path="isbn" id="isbn" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="isbn" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Cover</label>
                                        <div class="uk-form-controls">
                                            <select path="cover" name="cover" id="cover" class="uk-select">
                                                <option value="Paperback">Paperback</option>
                                                <option value="Hardback">Hardback</option>
                                            </select>
                                            <div class="has-error">
                                                <form:errors path="cover" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Special</label>
                                        <div class="uk-form-controls">
                                            <form:input list="specials" type="text" path="special" name="special" id="special" class="uk-input" />
                                            <datalist id="specials">
                                                <c:forEach items="${specials}" var="special">
                                                    <option value="${special}">${special}</option>
                                                </c:forEach>
                                            </datalist>
                                            <div class="has-error">
                                                <form:errors path="special" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Authors</label>
                                        <div class="uk-form-controls">
                                            <form:select path="authors" items="${authors}" multiple="true" itemValue="id" itemLabel="lastName" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="authors" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Categories</label>
                                        <div class="uk-form-controls">
                                            <form:select path="categories" items="${categories}" multiple="true" itemValue="id" itemLabel="category" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="categories" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Publisher</label>
                                        <div class="uk-form-controls">
                                            <form:select path="publisher" items="${publishers}" itemValue="id" itemLabel="brand" class="uk-select" />
                                            <div class="has-error">
                                                <form:errors path="publisher" class="help-inline"/>
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
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Price</label>
                                        <div class="uk-form-controls">
                                            <form:input type="number" path="price" id="price" max="300" step="1" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="urlPath" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Year Published</label>
                                        <div class="uk-form-controls">
                                            <form:input type="number" min="1900" value="1900" max="2030" step="1" path="yearPublished" id="yearPublished" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="yearPublished" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Book series</label>
                                        <div class="uk-form-controls">
                                            <form:input list="series" type="text" path="bookSeries" id="bookSeries" class="uk-input" />
                                            <datalist id="series">
                                                <c:forEach items="${bookSeries}" var="bookserie">
                                                    <option value="${bookserie}">${bookserie}</option>
                                                </c:forEach>
                                            </datalist>
                                            <div class="has-error">
                                                <form:errors path="bookSeries" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text">Quantity</label>
                                        <div class="uk-form-controls">
                                            <form:input type="number" min="0" value="0" max="300" step="1" path="quantity" id="quantity" class="uk-input" />
                                            <div class="has-error">
                                                <form:errors path="quantity" class="help-inline"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <label class="uk-form-label" for="form-horizontal-text"></label>
                                        <div class="uk-form-controls">
                                            <c:choose>
                                                <c:when test="${edit}">
                                                    <input type="submit" value="Update" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/books/' />">Cancel</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="submit" value="Save" class="uk-button uk-button-secondary"/> or <a href="<c:url value='/books/' />">Cancel</a>
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