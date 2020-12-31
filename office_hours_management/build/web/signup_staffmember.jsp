

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.SignUpStaffMember"%>

<html>
    <head>
        <title>Sign up as a staff</title>
        <script  src="https://www.google.com/recaptcha/api.js" async defer></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet"  type="text/css" href="style.css" >
    </head>
    <body>
        
    <div class="container">

            <form id="signup" action="<%=request.getContextPath()%>/SignUpStaffMember" id="my_captcha_form" method="GET">

        <div class="header">
        
            <h3>Sign Up As A Staff Member</h3>

        </div>
        
        <div class="sep"></div>

        <div class="inputs">
            
            <input type="text" placeholder="user name" name="userName" autofocus/>
            
            <input id="displayName" type="text" placeholder="Display Name"name="displayName" oninput="ajaxDiplayName()"/>  
            <div id="error1" class="error1" hidden ></div>
            <input id="email" type="email" placeholder="e-mail"  name="email" oninput="ajaxEmail()"/>
            <div id="error2" class="error2" hidden></div>
            
            <input type="text" placeholder="Subject"name="subject" />   
            <input type="text" placeholder="Dr/TA"name="type" />

             <div class="g-recaptcha" 
                              data-sitekey="6LfrFKQUAAAAAMzFobDZ7ZWy982lDxeps8cd1I2i" 
                              ></div>
            <input id="submit" type="submit" value="Sign up As A Student">
            

        
        </div>

    </form>
               <script>
            document.getElementById("my_captcha_form").addEventListener("submit", function (evt)
            {

                var response = grecaptcha.getResponse();
                if (response.length == 0)
                {
                    //reCaptcha not verified
                    alert("please verify you are humann!");
                    evt.preventDefault();
                    return false;
                }
                //captcha verified
                //do the rest of your validations here

            });
        </script>

</div>  
<script src="javascriptValidation.js"></script>

    </body>

</html>
