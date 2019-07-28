<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>chat!</h1>
        <security:authorize access="isAuthenticated()">
  Hello,   <security:authentication property="principal.username" /> 
</security:authorize>
        <div id="messages"></div>
        
        <form:form method="POST" action="/GroupProject/chat/" modelAttribute="cmessage" >
            <label for="name">Name</label>
            <form:input path="name" name="name" type="text" id="name" />
            <label for="message">Message</label>
            <form:input path="message" name="message" type="text" id="message" />
            <button>Send</button>
        </form:form>
                
        <script>
            const messageDiv = document.getElementById("messages");
            console.log(messageDiv);
            let messages = ${messages};
            console.log(messages);
            
            if(messages !== null){
                let ps = messages.map(m => '<p>'+m.name+' '+m.message+'</p>').join('');
                
                messageDiv.innerHTML = ps;
            }

        </script>
    </body>
</html>
