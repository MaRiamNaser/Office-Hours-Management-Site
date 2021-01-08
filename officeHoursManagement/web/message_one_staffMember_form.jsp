<%-- 
    Document   : message_form
    Created on : Jan 6, 2021, 9:39:49 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message Form Page</title>
    </head>
    <body>
        <h1>Message Form Page</h1>
        <form action="Validate">
            <table border="1">
                <tr> 
                    <td>Staff Member Display Name: </td>
                    <td><input type="text" name="staffMemberDisplayName"></td>  
                </tr>
                <tr> 
                    <td>Message Subject: </td>
                    <td><input type="text" name="messageSubject"></td>  
                </tr>
                <tr> 
                    <td>Content of Message: </td>
                    <td><input type="text" name="messageContent"></td>  
                </tr>
                <tr> 
                    <td>
                        <input type="submit" value="Send">
                        <input type="hidden" name="fromStudentDisplayName" value="0">
                    </td>  
                </tr>
            </table>
        </form>
    </body>
</html>
