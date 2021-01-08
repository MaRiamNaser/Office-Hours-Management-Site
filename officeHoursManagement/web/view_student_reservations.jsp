<%-- 
    Document   : view_student_reservations
    Created on : Jan 5, 2021, 6:56:57 PM
    Author     : DELL
--%>

<%@page import="model.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoSelectAll"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Integer studentID = 0;
    DaoSelectAll daoSelectAll = new DaoSelectAll();
    
    ArrayList<Reservation> allStudentReservations = new ArrayList<Reservation>();
    allStudentReservations = daoSelectAll.selectAllStudentReservations(studentID);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student Reservations Page</h1>
        <table border="1">
        <tr>
            <td>Reservation ID</td>
            <td>Office Hours ID</td>
            <td>To User ID</td>
        </tr>
        <%for (int i = 0; i < allStudentReservations.size(); i++) {%>
        <tr>
            <td><%=allStudentReservations.get(i).getReservationID()%></td>
            <td><%=allStudentReservations.get(i).getOfficeHoursID()%></td>
            <td><%=allStudentReservations.get(i).getToUserID()%></td>
            <td>
            <form action="CancelReservationByStudent">
                <input id="submit" type="submit" name="cancel" value="Cancel"><br>
            </form>
            </td>
        </tr>
        <%}%>
        </table>
    </body>
</html>
