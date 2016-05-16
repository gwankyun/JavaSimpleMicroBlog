/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kyun.bean;

import java.sql.PreparedStatement;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author ljqic
 */
public class Blog {

    private int id;
    private String author;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    private String time;
    private String content;

    public static boolean addBlog(Blog blog) {
        DB db = new DB();
        boolean result = false;
        String sql
                = "INSERT INTO `blog`(`content`, `time`, `author`)"
                + " VALUES "
                + "(?, now(), ?)";
        try {
            PreparedStatement preparedStatement = db.getPreparedStatement(sql);
            preparedStatement.setString(1, blog.content);
            preparedStatement.setString(2, blog.author);
            result = preparedStatement.executeUpdate() != 0;
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
            return result;
        }
    }

    public static ArrayList<Blog> getBlogs(User user) {
        DB db = new DB();
        ArrayList<Blog> result = new ArrayList<Blog>();
        String sql
                = "SELECT `id`, `content`, `time`, `author` FROM `blog`"
                + " WHERE "
                + "author = ? "
                + "ORDER BY time DESC";
        try {
            PreparedStatement preparedStatement = db.getPreparedStatement(sql);
            preparedStatement.setString(1, user.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {                
                Blog blog = new Blog();
                blog.setAuthor(user.getId());
                blog.setContent(resultSet.getString("content"));
                blog.setTime(resultSet.getString("time"));
                result.add(blog);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
            return result;
        }
    }
}
