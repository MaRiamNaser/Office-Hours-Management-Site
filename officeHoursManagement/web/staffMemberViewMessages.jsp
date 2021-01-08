<%-- 
    Document   : staffMemberViewMessages
    Created on : Jan 1, 2021, 11:21:26 PM
    Author     : ME
--%>

<%@page import="java.sql.*"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Received Messages</title>
    </head>
    <body>
        <%
              DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
              String email = request.getSession().getAttribute("email").toString();
              System.out.println("Email" + email);
              String ID = daoViewStaffMemberMessages.getStaffMemberID(email);
              System.out.println("ID"+ID);
              ResultSet RS = daoViewStaffMemberMessages.selectMessages(ID);
              while(RS.next()){
              %>
                    Message Number <a href="ViewStaffMemberMessages?method=GET&message=<%= RS.getString("messageID")%>"> <%= RS.getString("messageID")%></a> 
                    ,You received it from <%=RS.getString("fromUserID")%> and its content is: <%= RS.getString("actualMassage")%> in <%= RS.getString("date")%> <br>
        
             <%}
                
              daoViewStaffMemberMessages.closeConnection();
                  
              
              
        %>
    </body>
</html>
