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

/**
 *
 * @author ljqic
 */
public class DB {

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet ret = null;

    public PreparedStatement getPreparedStatement() {
        return preparedStatement;
    }

    public PreparedStatement getPreparedStatement(String sql) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getConnection().prepareStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        setPreparedStatement(preparedStatement);
        return preparedStatement;
    }

    public void setPreparedStatement(PreparedStatement preparedStatement) {
        this.preparedStatement = preparedStatement;
    }

    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/test";
        String name = "com.mysql.jdbc.Driver";
        String user = "root";
        String password = "";
        Connection connection = null;
        try {
            Class.forName(name);//指定连接类型  
            connection = DriverManager.getConnection(url, user, password);//获取连接  
        } catch (Exception e) {
            e.printStackTrace();
        }
        setConnection(connection);
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public ResultSet getResultSet(String sql) {
        try {
            preparedStatement = getPreparedStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            conn = null;
//            pst = null;
        }

        try {
            ret = preparedStatement.executeQuery();//执行语句，得到结果集  
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public ResultSet getResultSet(PreparedStatement preparedStatement) {
        ResultSet resultSet = null;
        try {
            resultSet = preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public void close() {
        try {
            if (ret != null) {
                ret.close();
            }
            if (connection != null) {
                connection.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
