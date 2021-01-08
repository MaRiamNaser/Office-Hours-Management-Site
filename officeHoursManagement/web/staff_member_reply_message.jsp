<%-- 
    Document   : StaffMemberReplyMessage
    Created on : Jan 1, 2021, 11:36:35 PM
    Author     : ME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply With A Message</title>
    </head>
    <body>
         <form id="signup" action="<%=request.getContextPath()%>/StaffMemberReplyMessage" id="my_captcha_form" method="GET">
             <input type="text" placeholder="Message"name="message1" autofocus />    
             <input id="submit" type="submit" value="Send Message">
         </form>
    </body>
</html>
