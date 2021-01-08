<%-- 
    Document   : subject_staffmembers
    Created on : Jan 3, 2021, 7:52:11 PM
    Author     : DELL
--%>

<%@page import="dao.DaoFinder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Integer subjectID = Integer.parseInt(request.getParameter("subjectID").toString());
    String subjectName = request.getParameter("subjectName").toString();
    
    DaoFinder daoFinder = new DaoFinder();
    ArrayList<User> staffMembers = new ArrayList<User>();
    User user = new User();
    user.setUserDisplayName("mona");
    //staffMembers.add(user);
    staffMembers = daoFinder.findStaffBySubject(subjectID);
    daoFinder.closeConnection();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>[subject ID : <%=subjectID%>] [subject name: <%=subjectName%>]</h1>
        <table border="1">
        <td>Staff Member</td>
        
        <%for (int i = 0; i < staffMembers.size(); i++) {%>
        <tr>
            <td><%=staffMembers.get(i).getUserType()%>. 
                <%=staffMembers.get(i).getUserDisplayName()%>
            </td>
            <td>
                <form action="contact_of_staffMember.jsp">
                    <input type="hidden" name="staffMemberID" value="<%=staffMembers.get(i).getUserID()%>">
                    <input type="hidden" name="staffMemberType" value="<%=staffMembers.get(i).getUserType()%>">
                    <input type="hidden" name="staffMemberDisplayName" value="<%=staffMembers.get(i).getUserDisplayName()%>">
                    <input id="submit" type="submit" name="subjectName" value="Find Contact"><br>
                </form>
            </td>
            <td>
                <form action="schedule_of_staffMember.jsp">
                    <input type="hidden" name="staffMemberID" value="<%=staffMembers.get(i).getUserID()%>">
                    <input type="hidden" name="staffMemberType" value="<%=staffMembers.get(i).getUserType()%>">
                    <input type="hidden" name="staffMemberDisplayName" value="<%=staffMembers.get(i).getUserDisplayName()%>">
                    <input id="submit" type="submit" name="subjectName" value="View office Hours Schedule"><br>
                </form>
            </td>
        </tr>
        <%}%>
        </table>
    </body>
</html>
