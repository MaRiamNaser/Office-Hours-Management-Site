

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

            <form class = "form_submit" id="signup" action="<%=request.getContextPath()%>/EditStaffMemberProfile" id="my_captcha_form" method="POST">

                <div class="header">

                    <h3> Edit Your Profile </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">

                    <input type="text" placeholder="user name" name="userName" autofocus disabled/>

                    <input id="displayName" type="text" placeholder="Display Name"name="displayName" oninput="ajaxDiplayName()"/>  
                    <div id="error1" class="error1" hidden ></div>
                    <input id="email" type="email" placeholder="e-mail"  name="email" oninput="ajaxEmail()" />
                    <div id="error2" class="error2" hidden></div>
                    <input type="password" placeholder="Password"name="password"/>   
                    <input type="text" placeholder="Subject"name="subject" />   
                    <input type="text" placeholder="Dr/TA"name="type" />

                    <input  id="submit" type="submit" value="Edit Profile">



                </div>

            </form>
            <br><br>
            
            <form id="signup" action="<%=request.getContextPath()%>/staffMemberViewMessages.jsp" id="my_captcha_form" method="GET">
                 <div class="header">

                    <h3> Reply to & View Your Messages </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input id="submit" type="submit" value="View Messages">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/StaffMemberMessageSpecificUser" id="my_captcha_form" method="GET">
                 <div class="header">

                    <h3> Message Specific User </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="Display Name"name="displayName" autofocus required />    
                    <input type="text" placeholder="Message"name="message1" required/>    
                    <input id="submit" type="submit" value="Send Message">
                </div>    
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/StaffMemberMessageSpecificSubject" id="my_captcha_form" method="GET">
                 <div class="header">

                    <h3> Message Staff Member </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="Subject Name"name="subjectName" autofocus required /> 
                    <input type="text" placeholder="Message"name="message1" required/>    
                    <input id="submit" type="submit" value="Send Message">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/view_student_details.jsp" id="my_captcha_form" method="GET">
                 <div class="header">

                    <h3> View Student Details </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="Display Name"name="displayName" autofocus required/> 
                    <input id="submit" type="submit" value="Search">
                </div>
            </form>
                <br>
            <form id="signup" action="<%=request.getContextPath()%>/view_reservations.jsp" id="my_captcha_form" method="GET">
                 <div class="header">

                    <h3> View Reservations </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                    <input type="text" placeholder="From Time-To Time "name="time" autofocus required /> 
                    <input type="text" placeholder="Date"name="date" required/>    
                    <input id="submit" type="submit" value="View Reservations">
                </div>
            </form>
                <br>
              <form id="signup" action="<%=request.getContextPath()%>/cancel_reservations.jsp" id="my_captcha_form" method="GET">
                   <div class="header">

                    <h3> Cancel Reservations </h3>

                </div>

                <div class="sep"></div>

                <div class="inputs">
                  <input type="checkbox" name="slot" autofocus /> Cancel Specific Slot Reservations <br>
                  <input type="checkbox" name="date" autofocus /> Cancel Specific Day Reservations <br>
                  <input id = "checkBtn1" id="submit" type="submit" value="Submit">
                </div>
            </form>
                
            
            <form id="signup" action="<%=request.getContextPath()%>/view_reservation_history.jsp" id="my_captcha_form" method="GET">
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
            <form id="signup" action="<%=request.getContextPath()%>/office_hours_forms.jsp" id="my_captcha_form" method="GET">
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
