<%-- 
    Document   : contactOfStaffMember
    Created on : Jan 5, 2021, 4:13:07 PM
    Author     : DELL
--%>

<%@page import="dao.DaoFinder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Integer staffMemberID = Integer.parseInt(request.getParameter("staffMemberID").toString());
    String staffMemberDisplyName = request.getParameter("staffMemberDisplayName").toString();
    String staffMemberType = request.getParameter("staffMemberType").toString();
    
    DaoFinder daoFinder = new DaoFinder();
    String staffMemberEmail = daoFinder.findContactForUser(staffMemberID);
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>staff Member Contact Page</title>
    </head>
    <body>
        <h1>Contact Page</h1>
        <table border="1">
            <tr>
                <td>Staff Member</td>
                <td>Contact</td>
            </tr>
            <tr>
                <td><%=staffMemberType%>. 
                    <%=staffMemberDisplyName%>
                </td>
                <td>
                    <%=staffMemberEmail%>
                </td>
            </tr>
        </table>
    </body>
</html>
