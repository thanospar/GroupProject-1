<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of books</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>   
        <script type="text/javascript">
            $(document).ready(function() {
                $('#books').DataTable();
            });
        </script>
    </head>
    <body>
        <h1>List of books</h1>
        <table border="1" id="books">
            <thead>
                <tr>
                    <th>Book Id</th>
                    <th>Title</th>
                    <th>Summary</th>
                    <th>ISBN</th>
                    <th>Cover</th>
                    <th>Year Published</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.title}</td>
                        <td>${book.summary}</td>
                        <td>${book.isbn}</td>
                        <td>${book.cover}</td>
                        <td>${book.yearPublished}</td>
                        <td><a href="books/deleteBook/${book.id}" target="_blank">Delete</a></td>
                        <td><a href="books/formUpdateBook/${book.id}" target="_blank">Update</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h2>${isDone}</h2>
    </body>
</html>
