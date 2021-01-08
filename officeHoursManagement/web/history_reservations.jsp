<%-- 
    Document   : history_reservations
    Created on : Jan 3, 2021, 12:50:45 AM
    Author     : ME
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="dao.DaoOfficeHoursTable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoViewOfficeHoursReservations"%>
<%@page import="dao.DaoViewStaffMemberMessages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservations History</title>
    </head>
    <body>
        
         <%
                
                   DaoViewStaffMemberMessages daoViewStaffMemberMessages = new DaoViewStaffMemberMessages();
                   DaoViewOfficeHoursReservations daoViewOfficeHoursReservations = new DaoViewOfficeHoursReservations();
                   DaoOfficeHoursTable daoOfficeHoursTable = new DaoOfficeHoursTable();
                   String email = request.getSession().getAttribute("email").toString();
                   String staffMemberID = daoViewStaffMemberMessages.getStaffMemberID(email);
                   ResultSet RS ;  String date = "";
                   ResultSet RS1 = daoOfficeHoursTable.selectAllData();
                   boolean flag = false;
                   ArrayList officeHoursIDs = new ArrayList();
                   if(request.getParameter("button1")!= null){
                       System.out.println("ssssss");
                    String time = request.getParameter("slot1");
                    String[] arrOfTime = time.split("-"); 
                    String fromTime = arrOfTime[0];  String toTime = arrOfTime[1];
                    System.out.println("fromTime " + fromTime + "ToTime" + toTime);
                    
                    //officeHoursIDs = daoOfficeHoursTable.selectSlotOfficeHours(fromTime, toTime, staffMemberID);
                    try {
                            while(RS1.next())
                            {
                                if(RS1.getString("fromTime").equals(fromTime) && RS1.getString("toTime").equals(toTime))
                                {
                                    flag = true;
                                    officeHoursIDs = daoOfficeHoursTable.selectSlotOfficeHours(fromTime, toTime, staffMemberID);
                                    
                                }
                                 if(flag == true)
                                 {
                                    break;
                                 }
                            }
                            daoOfficeHoursTable.closeConnection();  //RS1
                            if(flag == false ){%>
                                     <h3>You can't view reservations about invalid input !!!</h3>

                           <% }
                        } catch (Exception ex) {
                            System.out.print(ex);
                        }    
                    
                   }
                   if(request.getParameter("button2")!= null)
                    {
                        LocalDate date1;
                        String fromDate = request.getParameter("date1");
                        String toDate = request.getParameter("date2");
                        System.out.println("from "+fromDate + " "+toDate);
                        try {
                            while(RS1.next())
                            {
                                date1 = LocalDate.parse(RS1.getString("date"));
                                
                                if(date1.isAfter(LocalDate.parse(fromDate))&&date1.isBefore(LocalDate.parse(toDate))) //!!!LocalDate.parse("2018-05-05");
                                {
                                    flag = true;
                                    officeHoursIDs = daoOfficeHoursTable.selectOfficeHoursIDsByDate(fromDate, toDate, staffMemberID);
                                }
                                 
                            }
                            daoOfficeHoursTable.closeConnection();  //RS1
                            if(flag == false ){%>
                                     <h3>You can't view reservations about invalid input !!!</h3>
                           <% }
                        } catch (Exception ex) {
                            System.out.print(ex);
                        }    
                        
                        
                        
                    }
                     ResultSet RS2 = daoViewOfficeHoursReservations.selectAllOfficeHoursIDs();
                     boolean flag1 = false;
                     int counter = 0;
                    for(int i = 0; i < officeHoursIDs.size();i++)
                    {
                        
                        while(RS2.next()){
                           if(RS2.getString("officeHoursID").equals(officeHoursIDs.get(i))){

                                counter++;
                                if(counter == 1){%><h3> You have Reservations from   </h3><%}
                                flag1 = true;
                               // RS = daoViewOfficeHoursReservations.getReservationFromID((String)officeHoursIDs.get(i));
                                date = daoOfficeHoursTable.getSpecificSlotDate((String)officeHoursIDs.get(i));%>
                                <!--while(RS.next())
                                //{-->
                                  Student ID : <%= RS2.getString("fromUserID")%>   In Day: <%= date%><br>      
                                <%}
                            }
                        }
                    
                    if(flag1 == false)
                    {%>
                        <h3>You can't view reservations about invalid input !!!</h3>
                    <%}%>
    </body>
</html>
