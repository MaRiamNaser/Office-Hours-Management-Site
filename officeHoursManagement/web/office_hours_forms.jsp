<%-- 
    Document   : office_hours_forms
    Created on : Jan 4, 2021, 1:27:19 AM
    Author     : ME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  type="text/css" href="style.css" >
        <title>Office Hours Forms</title>
    </head>
    <body>
        <%

            if (request.getParameter("insert") != null) {%>
            <div class="container">
                <form id="signup" action="office_hours_management" id="my_captcha_form" method="GET">
                    <div class="header">

                    <h3> Insert a new Data </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">

                    <input id="fromTime" type="text" placeholder="From Time (HH:MM) " name="fromTime" autofocus required/><br>

                    <input id="toTime" type="text" placeholder="To Time (HH:MM)" name="toTime" required /><br>  
                    <input id="date" type="text" placeholder="Date (YYYY-MM-DD)"  name="date" required /><br>
                    <div id="error3" class="error3" hidden></div>
                    <select name="state" >
                        
                            <option value="offline"> Offline </option>
                            <option value="online"> Online </option>
                            
                    </select> 
                    <!--<input type="text" placeholder="State(offline/online)" name="state" required/><br>   -->
                    <input type="text" placeholder="Location" name="location"required  /><br> 
                    
                    <!--<input type="text" placeholder="Dr/TA ID" name="userID" required /><br>-->
                    <input id="submit" name = "button1" type="submit" value="Insert" onclick="ajaxSlot()"><br>
                </div>
                    
                </form> 
            </div>
        <% }
            if (request.getParameter("update") != null) {%>
            <div class="container">
                <form id="signup" action="office_hours_management" id="my_captcha_form" method="GET">
                    <div class="header">

                    <h3> Update an existed Data </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="OfficeHours ID" name="officeHoursID" required /><br>
                    <input id ="fromTime" type="text" placeholder="From Time (HH:MM) " name="fromTime" autofocus required/><br>
                    <input id = "toTime" type="text" placeholder="To Time (HH:MM)" name="toTime" required /><br>  
                    <input id = "date" type="text" placeholder="Date (YYYY-MM-DD)"  name="date" required oninput="ajaxSlot()"/><br>
                    <div id="error4" class="error4"></div>
                    <!--<input type="text" placeholder="State(offline/online)" name="state" required/> <br>  -->
                     <select name="state" >
                        
                            <option value="offline"> Offline </option>
                            <option value="online"> Online </option>
                            
                    </select> 
                    <input type="text" placeholder="Location" name="location"required  />  <br> 
                   <!-- <input type="text" placeholder="Dr/TA ID" name="userID" required /><br>-->
                    <input id="submit" name = "button2" type="submit" value="Update"><br>
                </div>
                </form> 
            </div>
        <%}
            if (request.getParameter("delete") != null) {%>
            <div class="container">
                <form id="signup" action="manage_office_hours.jsp" id="my_captcha_form" method="GET">
                    <div class="header">

                    <h3> Delete a Record </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="OfficeHours ID" name="officeHoursID"  autofocus required/>  <br> 
                    <input id="submit" name = "button3" type="submit" value="Delete">
                </div>
                </form> 
            </div>
        <% }
            if (request.getParameter("select") != null) {%>
            <div class="container">
                <form id="signup" action="manage_office_hours.jsp" id="my_captcha_form" method="GET"><div class="header">

                    <h3> Select All Data </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input id="submit" name = "button4" type="submit" value="Select">
                </div>
                </form> 
            </div>
        <%}


        %>
        <script src="javascriptValidation.js"></script>
    </body>
</html>
