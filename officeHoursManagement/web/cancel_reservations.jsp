<%-- 
    Document   : cancel_reservations
    Created on : Jan 2, 2021, 9:25:20 PM
    Author     : ME
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DaoViewOfficeHoursReservations"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  type="text/css" href="style.css" >
        <title>Cancel Reservations</title>
    </head>
    <body>
        <%
           
        if (request.getParameter("slot") != null) {%>
            
            
        <div class="container">    
            <form id="signup" action="<%=request.getContextPath()%>/cancel_specific_slot_and_day_reservations.jsp" id="my_captcha_form" method="GET">
                <div class="header">

                    <h3> Cancel Reservations by Slot </h3>

                </div>

                <div class="sep"></div>
                <div class="inputs">
                    <input type="text" placeholder="From Time-To Time "name="time" autofocus required /> <br>
                    <input type="text" placeholder="Date"name="date" required/> <br>
                    <input id="submit" name = "button1" type="submit" value="Cancel Reservations">
                </div>
            </form>
             </div>
                
        <% }
        if (request.getParameter("date") != null) {%>
            

        <div class="container">  
            <form id="signup" action="<%=request.getContextPath()%>/cancel_specific_slot_and_day_reservations.jsp" id="my_captcha_form" method="GET">
                <div class="header">

                    <h3> Cancel Reservations by Date </h3>

                </div>

                <div class="sep"></div>
                <div class="inputs">
                    <input type="text" placeholder="Date"name="date" autofocus required/> <br>   
                    <input id="submit" name = "button2" type="submit" value="Cancel Reservations">
                </div>
            </form>
        </div>
                
        <%}


        %>
    
    </body>
</html>
