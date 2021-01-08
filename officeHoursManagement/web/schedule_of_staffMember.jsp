<%-- 
    Document   : schedule_of_staffMember
    Created on : Jan 5, 2021, 4:35:19 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.OfficeHours"%>
<%@page import="dao.DaoViewOfficeHours"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Integer staffMemberID = Integer.parseInt(request.getParameter("staffMemberID").toString());
    String staffMemberDisplyName = request.getParameter("staffMemberDisplayName").toString();
    String staffMemberType = request.getParameter("staffMemberType").toString();
    
    ArrayList<OfficeHours> officeHourses = new ArrayList<OfficeHours>();
    DaoViewOfficeHours daoViewOfficeHours = new DaoViewOfficeHours();
    officeHourses = daoViewOfficeHours.findScheduleByStaffID(staffMemberID);
%> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Office Hours page</title>
    </head>
    <body>
        <h1><%=staffMemberType%>. <%=staffMemberDisplyName %> Schedule</h1>
        <table border="1">
        <tr>
            <td>Office Hours ID</td>
            <td>From Time</td>
            <td>To Time</td>
            <td>Date</td>
            <td>State</td>
            <td>Location</td>
        </tr>
        <%for (int i = 0; i < officeHourses.size(); i++) {%>
        <tr>
            <td><%=officeHourses.get(i).getOfficeHoursID()%></td>
            <td><%=officeHourses.get(i).getFromTime()%></td>
            <td><%=officeHourses.get(i).getToTime()%></td>
            <td><%=officeHourses.get(i).getDate()%></td>
            <td><%=officeHourses.get(i).getState()%></td>
            <td><%=officeHourses.get(i).getLocation()%></td>
            <td>
            <form action="ReserveAppointment">
                <input id="submit" type="submit" name="reserve" value="Reserve"><br>
            </form>
            </td>
        </tr>
        <%}%>
        </table>
    </body>
</html>
