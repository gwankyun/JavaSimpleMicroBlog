/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.JavaSimpleMicroBlog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author ljqic
 */
public class User {

    private String username = "";
    private String password = "";
    private String id = "";

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        String result = "";
        if (id.equals("")) {
            DB db = new DB();
            String sql
                    = "SELECT id FROM user"
                    + " WHERE "
                    + " username = ?"
                    + " AND "
                    + " password = ?";
            try {
                PreparedStatement preparedStatement = db.getPreparedStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                ResultSet resultSet = db.getResultSet(preparedStatement);
                if (resultSet.next()) {
                    result = resultSet.getString(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                return result;
            }
        } else {
            return id;
        }
    }

    public void setId(String id) {
        this.id = id;
    }

    public static boolean checkUser(User user) {
        boolean result = false;
        DB db = new DB();
        String username = user.getUsername();
        String password = user.getUsername();
        String sql = "select * from user where "
                + "username = '" + username + "'"
                + " and "
                + "password = '" + password + "'";
//            out.println(sql);
        ResultSet resultSet = db.getResultSet(sql);
        if (resultSet != null) {
            try {
                if (resultSet.next()
                        && resultSet.getString("username").equals(username)
                        && resultSet.getString("password").equals(password)) {
                    result = true;
                } else {
                    result = false;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                db.close();
                return result;
            }
        } else {
            return result;
        }
    }

    public static boolean hasUser(String username) {
        boolean result = false;
        DB db = new DB();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = db.getPreparedStatement(
                    "select username, password from user"
                    + " where "
                    + "username = ?"
            );
            preparedStatement.setString(1, username);
            resultSet = db.getResultSet(preparedStatement);
            while (resultSet.next()) {
                String name = resultSet.getString("username");
                if (name.equals(username)) {
                    result = true;
                }
            }
            resultSet.close();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        db.close();
        return result;
    }

    public static boolean register(String username, String password) {
        boolean result = false;
        DB db = new DB();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (hasUser(username)) {
            return false;
        } else {
            try {
                String sql
                        = "INSERT INTO `user`( `username`, `password`)"
                        + " VALUES "
                        + "(?, ?)";
//                out.println(sql);
                preparedStatement = db.getPreparedStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                result = preparedStatement.executeUpdate() != 0;
                preparedStatement.close();
            } catch (Exception e) {
            } finally {
                db.close();
                return result;
            }
        }
    }
}
