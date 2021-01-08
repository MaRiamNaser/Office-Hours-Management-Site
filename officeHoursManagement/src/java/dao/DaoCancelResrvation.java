/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database_connection.DBConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class DaoCancelResrvation {
    DBConnection  dBConnection = new DBConnection();
    Connection Con = dBConnection.getConnection();
    Statement Stmt = dBConnection.getStatement();
    
    public boolean cancelReservation(Integer reservationID){
        String query = "";

        try {
            query = "DELETE FROM office_hours.reservation WHERE reservationID = '" + reservationID + "'; ";
            
            int row = Stmt.executeUpdate(query);
            return true;
        } catch (Exception e) {
            System.out.print("###################Error in data base (in DaoCancelResrvation class):" + e);
            return false;
        }
    }
    
    public void closeConnection() throws SQLException{
        dBConnection.closeConnection(Con, Stmt);
    }
}
