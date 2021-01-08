<%-- 
    Document   : view_reservation_history
    Created on : Jan 3, 2021, 12:37:39 AM
    Author     : ME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  type="text/css" href="style.css" >
        <title>Reservation History Filtration</title>
    </head>
    <body>
       <%
                   if(request.getParameter("slot")!= null)
                   {%>
                    <div class="container">
                        <form id="signup" action="history_reservations.jsp" id="my_captcha_form" method="GET">
                            <div class="header">
                                <h3> Reservations by Slot </h3>
                            </div>
                      <div class="sep"></div>
                              <div class="inputs">
                                <input type="text" placeholder="From Time-To Time" name="slot1"  autofocus/>   <br>
                                <input id="submit" name = "button1" type="submit" value="View History of Reservations"><br>
                             </div>
                        </form> 
                     
                    </div>
                  <% }
                    
                   if(request.getParameter("date")!= null){%>
                    <div class="container">
                        <form id="signup" action="history_reservations.jsp" id="my_captcha_form" method="GET">
                            `<div class="header">

                    `           <h3> Reservations by Date </h3>

                            </div>

                            <div class="sep"></div>
                            <div class="inputs">
                                <input type="text" placeholder="From Date" name="date1"  autofocus/><br>
                                <input type="text" placeholder="To Date" name="date2"  autofocus/><br>
                                <input id="submit" name = "button2" type="submit" value="View History of Reservations">
                            </div>
                        </form> 
                
                    </div>
                            <%}

                   
                   %>
    </body>
</html>
