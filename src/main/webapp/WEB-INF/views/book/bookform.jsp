<%-- 
    Document   : bookform
    Created on : 20 Ιουλ 2019, 8:49:55 πμ
    Author     : filippos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Form</title>
    </head>
    <body>
        <h1>Book Form for Insert/Save</h1>
        <form:form modelAttribute="book" >
            
            <form:select path="authors" multiple="multiple" size="2" >
                <form:options items="${authors}" itemLabel="lastName" itemValue="id" />
            </form:select>
            
        </form:form>
    </body>
</html>
