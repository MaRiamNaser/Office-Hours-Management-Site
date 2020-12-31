<%-- 
    Document   : index
    Created on : Dec 30, 2020, 6:35:41 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet"  type="text/css" href="style.css" >
    </head>
    <body>
       
        
     <div class="container">

        <div id="signup">
        <div class="header">
        
            <h3>Who are you?</h3>

        </div>
        
                        
        <div class="sep"></div>

        <div class="inputs">
            
 
         <form action="signup_student.jsp" method="GET">
            <input id ="submit" type ="submit" value="SignUp As Student"> 
        </form>
        <form action="signup_staffmember.jsp" method="GET">
            <input id ="submit" type ="submit" value="SignUp As Staff member"> 
        </form>
        <form action="signin_user.jsp" method="GET">
            <input id ="submit" type ="submit" value="SignIn"> 
        </form>
            

        
        </div>


</div>
     </div>
    </body>
</html>
