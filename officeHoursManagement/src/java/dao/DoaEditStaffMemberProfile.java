/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import database_connection.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author ME
 */
public class DoaEditStaffMemberProfile {

    DBConnection dBConnection;

    public String defineID(String email) {
        dBConnection = new DBConnection();
        String query = "";
        ResultSet RS = null;
        String ID = "";

        try {

            query = "select userID from user where email =  '" + email + "';";
            Connection Con = dBConnection.getConnection();
            Statement Stmt = dBConnection.getStatement();

            RS = Stmt.executeQuery(query);
            while (RS.next()) {
                ID = RS.getString("userID");
            }
            Stmt.close();
            Con.close();
        } catch (Exception e) {
            System.out.print("###################Error in data base:" + e);

        }
        return ID;
    }

    public void editProfile(User user, String ID, ArrayList<String> parametersNames, ArrayList<String> parametersValues) {
        dBConnection = new DBConnection();
        String query = "";
        ResultSet RS = null;

        try {

            Connection Con = dBConnection.getConnection();
            Statement Stmt = dBConnection.getStatement();

            for (int i = 0; i < parametersNames.size(); i++) {
                if (!parametersValues.get(i).equals("")) {
                    System.out.println("NAmes "+parametersNames.get(i));
                    if(parametersNames.get(i).equals("displayName"))
                    {
                        query = "update user set displayName = '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    }
                    if(parametersNames.get(i).equals("email"))
                    {
                        query = "update user set email= '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    }
                    if(parametersNames.get(i).equals("type"))
                    {
                        query = "update user set type = '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    }
                    if(parametersNames.get(i).equals("password"))
                    {
                        query = "update user set password = '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    }
                    if(parametersNames.get(i).equals("subjectName"))
                    {
                        query = "update user set subjectName = '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    }
                    /*String qur1 = "DECLARE @tmp NVARCHAR(45);";
                    boolean y = Stmt.execute(qur1);
                    String qur = "set @tmp = '"+parametersNames.get(i)+"';";
                    boolean x = Stmt.execute(qur);*/
                    //query = "update user set '"+parametersNames.get(i)+"' = '" + parametersValues.get(i) + "' where userID = '"+ID+"';";
                    int rows = Stmt.executeUpdate(query);
                }
            }

            Stmt.close();
            Con.close();
        } catch (Exception e) {
            System.out.print("###################Error in data base:" + e);

        }
    }

}
