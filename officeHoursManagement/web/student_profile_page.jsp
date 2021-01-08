

<%@page import="model.Reservation"%>
<%@page import="model.User"%>
<%@page import="model.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoSelectAll"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    DaoSelectAll daoSelectAll = new DaoSelectAll();
    
    ArrayList<Subject> allSubjects = new ArrayList<Subject>();
    allSubjects = daoSelectAll.selectAllSubjects();
    
    ArrayList<User> allStaffMembers = new ArrayList<User>();
    allStaffMembers = daoSelectAll.selectAllStaffMembers();
    
    daoSelectAll.closeConnection();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student profile Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet"  type="text/css" href="student_profile_style.css" >
        <link rel="stylesheet"  type="text/css" href="dropdown_list_style.css" >
        <!-- Load an icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        
        <!-- The sidebar -->
        <!--<div class="sidebar">
            <a href="#home"><i class="fa fa-fw fa-home"></i> Home</a>
            <a href="#services"><i class="fa fa-fw fa-wrench"></i> Services</a>
            <a href="#clients"><i class="fa fa-fw fa-user"></i> Clients</a>
            <a href="#contact"><i class="fa fa-fw fa-envelope"></i> Contact</a>
        </div>

        <div class="main">
            <div class="navbar">
                <a class="active" href="#"><i class="fa fa-fw fa-home"></i> Home</a>
                <a href="#"><i class="fa fa-fw fa-gear"></i> Edit Profile</a>
                <a href="#"><i class="fa fa-fw fa-search"></i> Search</a>
                <div class="navbar-right">
                    <a href="#"><i class="fa fa-fw fa-envelope"></i> Contact</a>
                    <a href="#"><i class="fa fa-fw fa-user"></i> Sign out</a>
                </div>
            </div>
            <p>Some text some text some text some text..</p>
        </div>-->

        <div class="dropdown">
            <button onclick="findStaffBySubjectButton()" class="dropbtn">Find Staff Member by Subject</button>
            <div id="myDropdown1" class="dropdown-content"  style="padding:5px 5px 5px">
                <input type="text" placeholder="Enter subject name.." id="myInput1" onkeyup="filterSubjects()">
                <%  for (int i = 0; i < allSubjects.size(); i++) {
                        Integer subjectID = allSubjects.get(i).getSubjectID();
                        String subjectName = allSubjects.get(i).getSubjectName();%>
                        <form action="subject_staffmembers.jsp">
                            <input type="hidden" name="subjectID" value="<%= subjectID%>">
                            <input type="hidden" name="subjectName" value="<%=subjectName%>">
                            <a><%= subjectName%> <input id="submit" type="submit" name="submit" value="Choose" style="float: right;"></a>
                        </form>
                <% }%> 
                
            </div>
        </div>
               
        <div class="dropdown">
            <button onclick="viewStaffContactButton()" class="dropbtn">View Staff Member Contact</button>
            <div id="myDropdown2" class="dropdown-content"  style="padding:5px 5px 5px">
                <input type="text" placeholder="Enter staff member name.." id="myInput2" onkeyup="filterStaffMembers()">
                <%  for (int i = 0; i < allStaffMembers.size(); i++) {
                        Integer staffMemberID = allStaffMembers.get(i).getUserID();
                        String staffMemberDisplyName = allStaffMembers.get(i).getUserDisplayName();
                        String staffMemberType = allStaffMembers.get(i).getUserType();%>
                        <form action="contact_of_staffMember.jsp">
                            <input type="hidden" name="staffMemberID" value="<%=staffMemberID%>">
                            <input type="hidden" name="staffMemberType" value="<%=staffMemberType%>">
                            <input type="hidden" name="staffMemberDisplayName" value="<%=staffMemberDisplyName%>">
                            <a><%= staffMemberDisplyName%> <input id="submit" type="submit" name="submit" value="Choose" style="float: right;"></a>
                        </form>
                <% }%> 
                
            </div>
        </div>
                <form action="view_student_reservations.jsp">
                    <input id="submit" type="submit" name="submit" value="View my Reservations">
                </form>
                
                <form action="message_one_staffMember_form.jsp">
                    <input id="submit" type="submit" name="submit" value="Send Message to Specific Staff Member">
                </form>

                <form action="message_all_subject_staff_form.jsp">
                    <input id="submit" type="submit" name="submit" value="Send Message to all subject Staff Members">
                </form>
                
                <form action="edit_student_profile_form.jsp">
                    <input id="submit" type="submit" name="submit" value="Edit Profile">
                </form>
                
        <script>
            /* When the user clicks on the button,
             toggle between hiding and showing the dropdown content */
            function findStaffBySubjectButton() {
                document.getElementById("myDropdown1").classList.toggle("show");
            }
            
            function viewStaffContactButton() {
                document.getElementById("myDropdown2").classList.toggle("show");
            }

            function filterSubjects() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("myInput1");
                filter = input.value.toUpperCase();
                div = document.getElementById("myDropdown1");
                a = div.getElementsByTagName("a");
                for (i = 0; i < a.length; i++) {
                    txtValue = a[i].textContent || a[i].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        a[i].style.display = "";
                    } else {
                        a[i].style.display = "none";
                    }
                }
            }
            
            function filterStaffMembers() {
                var input, filter, ul, li, a, i;
                input = document.getElementById("myInput2");
                filter = input.value.toUpperCase();
                div = document.getElementById("myDropdown2");
                a = div.getElementsByTagName("a");
                for (i = 0; i < a.length; i++) {
                    txtValue = a[i].textContent || a[i].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        a[i].style.display = "";
                    } else {
                        a[i].style.display = "none";
                    }
                }
            }
            
        </script>
    </body>
</html>
