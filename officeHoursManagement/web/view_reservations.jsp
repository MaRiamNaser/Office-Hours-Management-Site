<%-- 
    Document   : view_reservations
    Created on : Jan 2, 2021, 5:57:12 PM
    Author     : ME
--%>

<%@page import="dao.DaoOfficeHoursTable"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DaoViewOfficeHoursReservations"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Reservations</title>
    </head>
    <body>
        
        <%
              DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
              DaoOfficeHoursTable daoOfficeHoursTable = new DaoOfficeHoursTable();
              String email = request.getSession().getAttribute("email").toString();
              String staffMemberID = daoViewStaffMemberMessages.getStaffMemberID(email);
              String time = request.getParameter("time");
              String date = request.getParameter("date");
              String[] arrOfTime = time.split("-"); 
              String fromTime = arrOfTime[0];  String toTime = arrOfTime[1];
              DaoViewOfficeHoursReservations daoViewOfficeHoursReservations = new DaoViewOfficeHoursReservations();
              System.out.println("fromTime " + fromTime + "ToTime" + toTime);
              boolean flag = false;
              ResultSet RS1 = daoOfficeHoursTable.selectAllData();
              try {
                while(RS1.next())
                {
                    if(RS1.getString("fromTime").equals(fromTime) && RS1.getString("toTime").equals(toTime)&& RS1.getString("date").equals(date))
                    {
                        
                        flag = true;
                        String officeHoursID = daoOfficeHoursTable.selectOfficeHours(fromTime, toTime, date, staffMemberID);
                        ResultSet RS = daoViewOfficeHoursReservations.getReservationFromID(officeHoursID);%>
                          <h3> You have Reservations from   </h3>
                         <% while(RS.next()){
                          %>
                          Student ID : <%= RS.getString("fromUserID")%><br>
                         <%
                             }
                             daoViewOfficeHoursReservations.closeConnection();
                    }
                    if(flag == true)
                    {
                        break;
                    }
                }
                daoOfficeHoursTable.closeConnection();
                if(flag == false){%>
                         <h3>You can't view reservations about invalid input !!!</h3>
                       
               <% }
            } catch (Exception ex) {
                System.out.print(ex);
            }    
        %>
    </body>
</html>
