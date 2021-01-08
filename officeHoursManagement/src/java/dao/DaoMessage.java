/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database_connection.DBConnection;
import java.sql.Connection;
import java.sql.Statement;
import model.Message;

/**
 *
 * @author DELL
 */
public class DaoMessage {
    DBConnection  dBConnection = new DBConnection();
    
    public boolean insertMessage(Message message){
        Connection Con = dBConnection.getConnection();
        Statement Stmt = dBConnection.getStatement();
        String query = "";

        try {
            query = "INSERT INTO office_hours.message (fromUserID, toUserID, actualMassage, date) VALUES ("
                       + " '"+message.getFromUserID()+"',"
                       + " '"+message.getToUserID()+"',"
                       + " '"+message.getActualMessage()+"',"
                       + " '"+message.getDate()+"');";
            
            int row = Stmt.executeUpdate(query);

            dBConnection.closeConnection(Con, Stmt);
            return true;
        } catch (Exception e) {
            System.out.print("###################Error in data base (in DaoMessage class):" + e);
            return false;
        }
    }
}
