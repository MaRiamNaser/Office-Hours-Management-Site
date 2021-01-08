/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoOfficeHoursTable;
import dao.DaoViewStaffMemberMessages;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OfficeHours;

/**
 *
 * @author ME
 */
@WebServlet(name = "office_hours_management", urlPatterns = {"/office_hours_management"})
public class office_hours_management extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public OfficeHours getInputs(HttpServletRequest request,OfficeHours officeHours)
    {
        DaoViewStaffMemberMessages daoViewStaffMemberMessages= new DaoViewStaffMemberMessages();
        String fromTime = request.getParameter("fromTime");
        String toTime = request.getParameter("toTime");
        String date = request.getParameter("date");
        String state = request.getParameter("state");
        String location = request.getParameter("location");
        String email = request.getSession().getAttribute("email").toString();
        String userID = daoViewStaffMemberMessages.getStaffMemberID(email);
       // String userID = request.getParameter("userID");
        officeHours.setFromTime(fromTime);
        officeHours.setToTime(toTime);
        officeHours.setDate(LocalDate.parse(date));
        officeHours.setState(state);
        officeHours.setLocation(location);
        officeHours.setUserID(Integer.parseInt(userID));
        return officeHours;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            OfficeHours officeHours = new OfficeHours(); 
            DaoOfficeHoursTable daoOfficeHoursTable = new DaoOfficeHoursTable();
              if(request.getParameter("button1")!= null){
                    officeHours = getInputs(request,officeHours);
                    
                daoOfficeHoursTable.insertData(officeHours);
                String htmlRespone = "<html>";
                htmlRespone += "<body>";
                htmlRespone += "<br><br><h3>You insert the data successfully" + "</h3>";
                htmlRespone += "</body>";
                htmlRespone += "</html>";

                out.println(htmlRespone);
                            
                   }
              if(request.getParameter("button2")!= null){
                  String officeHoursID = request.getParameter("officeHoursID");
                    officeHours = getInputs(request,officeHours);
                    
                daoOfficeHoursTable.updateDate(officeHoursID, officeHours);
                String htmlRespone = "<html>";
                htmlRespone += "<body>";
                htmlRespone += "<br><br><h3>You update the data successfully" + "</h3>";
                htmlRespone += "</body>";
                htmlRespone += "</html>";

                out.println(htmlRespone);
                            
                   }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
