/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database_connection.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Reservation;
import model.Subject;
import model.User;

/**
 *
 * @author DELL
 */
public class DaoSelectAll {
    DBConnection dBConnection = new DBConnection();
    Connection Con = dBConnection.getConnection();
    Statement Stmt = dBConnection.getStatement();
    ResultSet RS = null;
        
    public ArrayList<Subject> selectAllSubjects() {
        ArrayList<Subject> subjects = new ArrayList<Subject>();
        String query = "";

        try {
            query = "SELECT subjectID, sujectName FROM office_hours.subject;";
            RS = Stmt.executeQuery(query);

            while(RS.next()) {
                    Subject subject = new Subject();
                    subject.setSubjectID(RS.getInt("subjectID"));
                    subject.setSubjectName(RS.getString("sujectName"));
                    subjects.add(subject);
            }
        } catch (Exception e) {
            System.out.print("###################Error in data base (in DaoSelectAll class):" + e);
        }
        return subjects;
    }
    
    public ArrayList<User> selectAllStaffMembers() {
        ArrayList<User> staffMembers = new ArrayList<User>();
        String query = "";

        try {
            query = "SELECT userID, displayName, type FROM office_hours.user WHERE type = 'Dr' OR type = 'TA';";
            RS = Stmt.executeQuery(query);

            while(RS.next()) {
                    User staffMember = new User();
                    staffMember.setUserID(RS.getInt("userID"));
                    staffMember.setUserDisplayName(RS.getString("displayName"));
                    staffMember.setUserType(RS.getString("type"));
                    staffMembers.add(staffMember);
            }
            
        } catch (Exception e) {
            System.out.print("###################Error in data base (in DaoSelectAll class):" + e);
        }
        return staffMembers;
    }
    
    public ArrayList<Reservation> selectAllStudentReservations(Integer studentID){
        ArrayList<Reservation> reservations = new ArrayList<Reservation>();
        String query = "";

        try {
            query = "SELECT reservationID, officeHoursID, toUserID FROM office_hours.reservation WHERE fromUserID = '"+studentID+"';";
            RS = Stmt.executeQuery(query);

            while(RS.next()) {
                    Reservation reservation = new Reservation();
                    reservation.setReservationID(RS.getInt("reservationID"));
                    reservation.setOfficeHoursID(RS.getInt("officeHoursID"));
                    reservation.setToUserID(RS.getInt("toUserID"));
                    reservations.add(reservation);
            }
            
        } catch (Exception e) {
            System.out.print("###################Error in data base (in DaoSelectAll class):" + e);
        }
        return reservations;
    }
    
    public void closeConnection() throws SQLException{
        dBConnection.closeConnection(Con, Stmt);
        RS.close();
    }
}