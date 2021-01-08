<%-- 
    Document   : cancel_specific_slot_and_day_reservations
    Created on : Jan 2, 2021, 7:13:22 PM
    Author     : ME
--%>

<%@page import="dao.DaoOfficeHoursTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.DaoViewOfficeHoursReservations"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Specific Slot Or Day Reservations</title>
    </head>
    <body>
       
        <%
                   DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
                   DaoViewOfficeHoursReservations daoViewOfficeHoursReservations = new DaoViewOfficeHoursReservations();
                   DaoOfficeHoursTable daoOfficeHoursTable = new DaoOfficeHoursTable();
                   boolean flag = false , flag1 = false; 
                   ResultSet RS1 = daoOfficeHoursTable.selectAllData();
                   ResultSet RS = daoViewOfficeHoursReservations.selectAllOfficeHoursIDs();
                   if(request.getParameter("button1")!= null){
                        String email = request.getSession().getAttribute("email").toString();
                        String staffMemberID = daoViewStaffMemberMessages.getStaffMemberID(email);
                        String time = request.getParameter("time");
                        String date = request.getParameter("date");
                        String[] arrOfTime = time.split("-"); 
                        String fromTime = arrOfTime[0];  String toTime = arrOfTime[1];
                       
                        System.out.println("fromTime " + fromTime + "ToTime" + toTime);
                        
                        try {
                            while(RS1.next())
                            {
                                if(RS1.getString("fromTime").equals(fromTime) && RS1.getString("toTime").equals(toTime)&& RS1.getString("date").equals(date))
                                {
                                    System.out.println("cccccccccccccc");
                                    flag1 = true;
                                    String officeHoursID = daoOfficeHoursTable.selectOfficeHours(fromTime, toTime, date, staffMemberID);
                                    while(RS.next())
                                    {
                                        if(RS.getString("officeHoursID").equals(officeHoursID))
                                        {
                                            flag = true;
                                            daoViewOfficeHoursReservations.selectReservarionSpecificSlotID(officeHoursID);
                                        }
                                        if(flag == true)
                                        {%>
                                             <h3>You have canceled all reservations successfully </h3>
                                            <%break;
                                        }
                                    }
                                    daoViewOfficeHoursReservations.closeConnection();  //RS
                                    
                                }
                                 if(flag1 == true)
                                 {
                                    break;
                                 }
                            }
                            daoOfficeHoursTable.closeConnection();  //RS1
                            if(flag == false || flag1 == false){%>
                                     <h3>You can't cancel reservations about invalid input !!!</h3>

                           <% }
                        } catch (Exception ex) {
                            System.out.print(ex);
                        }    
                   }
                   if(request.getParameter("button2")!= null)
                    {
                            String date = request.getParameter("date");
                            System.out.println("Date "+date);
                            try {
                            while(RS1.next())
                            {
                                if(RS1.getString("date").equals(date))
                                {
                                    flag1 = true;
                                    ResultSet RS2 = daoOfficeHoursTable.getSpecificOfficeHoursIDS(date);
                                     while(RS.next())
                                    {
                                        
                                            String ID = "";
                                            while (RS2.next()) {
                                                ID = RS2.getString("officeHoursID");
                                                if(RS.getString("officeHoursID").equals(ID))
                                                {
                                                     flag = true;
                                                    daoViewOfficeHoursReservations.selectReservarionSpecificSlotID(ID);
                                                }
                                            }
                                            if(flag == true)
                                            {%>
                                                     <h3>You have canceled all reservations successfully </h3>
                                                   <% break;
                                            }
                                    }
                                     daoViewOfficeHoursReservations.closeConnection();   //RS
                                        
                                    }
                                   
                                
                                if(flag1 == true)
                                {
                                    break;
                                }
                            }
                            daoOfficeHoursTable.closeConnection();   //RS1
                           
                            if(flag == false || flag1 == false){%>
                                     <h3>You can't cancel reservations about invalid input !!!</h3>

                           <% }
                        } catch (Exception ex) {
                            System.out.print(ex);
                        }    
                    }
                   
        %>
       
             
             
                
    </body>
</html>
