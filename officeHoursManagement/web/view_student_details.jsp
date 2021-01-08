<%-- 
    Document   : view_student_details
    Created on : Jan 2, 2021, 3:49:50 AM
    Author     : ME
--%>

<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DaoViewStudentDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Student Contact Details</title>
    </head>
    <body>
        <%
              DaoViewStudentDetails daoViewStudentDetails = new DaoViewStudentDetails();
              DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
              String displayName = request.getParameter("displayName");
              boolean flag = false;
              ResultSet RS1 = daoViewStaffMemberMessages.selectColumns();
            try {
                while(RS1.next())
                {
                    if(RS1.getString("displayName").equals(displayName) && RS1.getString("type").equals("student"))
                    {
                        flag = true;
                        System.out.println("displayName " + displayName);
                        ResultSet RS = daoViewStudentDetails.selectStudentDetails(displayName);
                        while(RS.next()){
                        %>
                        <h3>The Student contact details </h3>
                        ID        : <%= RS.getString("userID")%><br>
                        Name      : <%=RS.getString("userName")%> <br>
                        Email     : <%= RS.getString("email")%> <br>
                        Department: <%= RS.getString("department")%> <br>

                       <%}
                
                        daoViewStudentDetails.closeConnection();
                    }
                    if(flag == true)
                    {
                        break;
                    }
                }
                daoViewStaffMemberMessages.closeConnection();
                if(flag == false){%>
                        <h3>You can't search about(invalid input / staff member)!!! </h3>
                     
                <%}
            } catch (Exception ex) {
                System.out.print(ex);
            }
                  
              
              
        %>
    </body>
</html>
