

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.DoaEditStaffMemberProfile"%>
<%@page import="dao.DaoOfficeHoursTable"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page import="model.OfficeHours"%>
<%@page import="java.util.*"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Member Profile</title>
        <link rel="stylesheet"  type="text/css" href="style.css" >
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            var counter = 0;
            $(document).ready(function () {
                $('#checkBtn1,#checkBtn2,#checkBtn3').click(function() {
                  checked = $("input[type=checkbox]:checked").length;
                 
                  if(!checked) {
                    alert("You must check only one checkbox.");
                    return false;
                  }
                  if(checked > 1)
                  {
                      alert("You must check only one checkbox.");
                    return false;
                  }
                 

                });
            });
            $(document).ready(function () {
                $('.form_submit').submit(function(){
                    $('.form_submit :input').each(function() {
                       
                        if(($.trim($(this).val()).length === 0)){
                            counter ++;
                        }
                    });
                    //alert(counter);
                    if(counter >= 6)
                    {
                        alert('Please, enter at least one field.');
                        return false;
                    }
                 });


                
            });

        </script>
        
        <div class="container">

            <form class = "form_submit" id="signup" action="<%=request.getContextPath()%>/EditStaffMemberProfile" method="POST">
                 <%
            DoaEditStaffMemberProfile doaEditStaffMemberProfile = new DoaEditStaffMemberProfile();
            ResultSet RS = null;
            String email = request.getSession().getAttribute("email").toString();
            RS = doaEditStaffMemberProfile.selectAllData(email);
            String userName = "",displayName = "",email1 = "",password = "",subject = "",type = "";
            while(RS.next()){
                 userName =  RS.getString("userName");
                 displayName = RS.getString("displayName");
                 email1 =  RS.getString("email");
                 password =  RS.getString("password");
                 subject =  RS.getString("subjectName");
                 type =  RS.getString("type");
            }
            doaEditStaffMemberProfile.closeConnection();
            //System.out.println("Name" + userName);
        %>

                <div class="header">

                    <h3> Edit Your Profile </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">

                    <input type="text" placeholder="user name" name="userName" autofocus disabled value=<%= userName%> />

                    <input id="displayName" type="text" placeholder="Display Name"name="displayName" oninput="ajaxDiplayName()" value=<%= displayName%>  />  
                    <div id="error1" class="error1" hidden ></div>
                    <input id="email" type="email" placeholder="e-mail"  name="email" oninput="ajaxEmail()" value=<%=email1%> />
                    <div id="error2" class="error2" hidden></div>
                    <input type="text" placeholder="Password"name="password" value=<%= password%> />   
                    <input type="text" placeholder="Subject"name="subject" value=<%= subject%> />   
                    <input type="text" placeholder="Dr/TA"name="type" value=<%=type%> />

                    <input  id="submit" type="submit" value="Edit Profile">



                </div>

            </form>
            <br><br>
            
            <form id="signup" action="<%=request.getContextPath()%>/staffMemberViewMessages.jsp" method="GET">
                 <div class="header">

                    <h3> Reply to & View Your Messages </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input id="submit" type="submit" value="View Messages">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/StaffMemberMessageSpecificUser"  method="GET">
                 <div class="header">

                    <h3> Message Specific User </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input list="displayNames" placeholder="Display Name" name="displayName" autofocus required />
                    <%
                        DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
                        ResultSet RS1 = null;
                        RS1 = daoViewStaffMemberMessages.selectColumns();%>
                        <datalist id = "displayNames">
                    <%while(RS1.next())
                        {%>
                        <option value=<%= RS1.getString("displayName")%> >
                       <% }
                       daoViewStaffMemberMessages.closeConnection();
                       %>
                        </datalist>
                    <input type="text" placeholder="Message"name="message1" required/>    
                    <input id="submit" type="submit" value="Send Message">
                </div>    
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/StaffMemberMessageSpecificSubject"  method="GET">
                 <div class="header">

                    <h3> Message Staff Member </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input list="subjectNames" placeholder="Subject Name" name="subjectName" autofocus required />
                    <%
                       daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
                         RS1 = null;
                        RS1 = daoViewStaffMemberMessages.selectStaffColumns();%>
                        <datalist id = "subjectNames">
                    <%while(RS1.next())
                        {%>
                        <option value=<%= RS1.getString("subjectName")%> >
                       <% }
                       daoViewStaffMemberMessages.closeConnection();
                       %>
                        </datalist>
                   <!-- <input type="text" placeholder="Subject Name"name="subjectName" autofocus required /> -->
                    <input type="text" placeholder="Message"name="message1" required/>    
                    <input id="submit" type="submit" value="Send Message">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/view_student_details.jsp" method="GET">
                 <div class="header">

                    <h3> View Student Details </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                     <input list="displayNames" placeholder="Display Name" name="displayName" autofocus required />
                    <%
                        daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
                        RS1 = null;
                        RS1 = daoViewStaffMemberMessages.selectColumns();%>
                        <datalist id = "displayNames">
                    <%while(RS1.next())
                        {%>
                        <option value=<%= RS1.getString("displayName")%> >
                       <% }
                       daoViewStaffMemberMessages.closeConnection();
                       %>
                        </datalist>
                    <!--<input type="text" placeholder="Display Name"name="displayName" autofocus required/> -->
                    <input id="submit" type="submit" value="Search">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/view_reservations.jsp" method="GET">
                 <div class="header">

                    <h3> View Reservations </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input list="From Time-To Time" placeholder="From Time-To Time "name="time" autofocus required /> 
                    <%
                        DaoOfficeHoursTable daoOfficeHoursTable = new DaoOfficeHoursTable();
                        RS1 = null;
                        RS1 = daoOfficeHoursTable.selectAllData();%>
                        <datalist id = "From Time-To Time">
                    <%while(RS1.next())
                        {%>
                        <option value=<%= RS1.getString("fromTime")%>-<%=RS1.getString("toTime")%> >
                       <% }
                       daoOfficeHoursTable.closeConnection();
                       %>
                        </datalist>
                    <input list="dates" placeholder="Date "name="date" autofocus required /> 
                    <%
                         daoOfficeHoursTable = new DaoOfficeHoursTable();
                        RS1 = null;
                        RS1 = daoOfficeHoursTable.selectAllData();%>
                        <datalist id = "dates">
                    <%while(RS1.next())
                        {%>
                        <option value=<%= RS1.getString("date")%> >
                       <% }
                       daoOfficeHoursTable.closeConnection();
                       %>
                        </datalist> 
                    <input id="submit" type="submit" value="View Reservations">
                </div>
            </form>
                <br>
               
              <form id="signup" action="<%=request.getContextPath()%>/cancel_reservations.jsp" method="GET">
                   <div class="header">

                    <h3> Cancel Reservations </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                  <input type="checkbox" name="slot"  /> Cancel Specific Slot Reservations 
                  <input type="checkbox" name="date" autofocus /> Cancel Specific Day Reservations 
                  <input id = "checkBtn1" id="submit" type="submit" value="Submit">
                </div>
            </form>
                
            
            <form id="signup" action="<%=request.getContextPath()%>/view_reservation_history.jsp" method="GET">
                 <div class="header">

                    <h3> View Reservation History </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="checkbox" name="slot" value = "Slot" autofocus /> Slot  
                    <input type="checkbox" name="date" value=" From date – To date" autofocus />  From date - To date 
                    <input id = "checkBtn2" id="submit" type="submit" value="Submit">
                </div>
            </form>
            <form id="signup" action="<%=request.getContextPath()%>/office_hours_forms.jsp" method="GET">
                 <div class="header">

                    <h3> Office Hours Management </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="checkbox" name="insert" autofocus /> Insert  
                    <input type="checkbox" name="update" autofocus /> Update 
                    <input type="checkbox" name="delete" autofocus /> Delete
                    <input type="checkbox" name="select" autofocus /> Select
                    <input id = "checkBtn3" id="submit" type="submit" value="Submit">
                </div>
            </form>    
                
                
        </div>
            <script src="javascriptValidation.js"></script>
    </body>
</html>
