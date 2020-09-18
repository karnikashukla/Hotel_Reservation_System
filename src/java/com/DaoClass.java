package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author karnika
 */
public class DaoClass {

    public static int i = 0;
    public static Connection conn = null;
    public static boolean status = true;

    public static boolean Register(String uname, String email, String contact, String password) {

        try {
            //Connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");

            //Query
            String query = "insert into user_registration(userName,userEmail,userMobile,userPassword) values (?,?,?,?)";

            final PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, uname);
            ps.setString(2, email);
            ps.setString(3, contact);
            ps.setString(4, password);

            i = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean Login(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");

            final PreparedStatement stmt = conn.prepareStatement("select * from user_registration where userName = ? and userPassword = ?");

            stmt.setString(1, username);
            stmt.setString(2, password);
            final ResultSet rs = stmt.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return status;
    }

    public static boolean Book(String guestName, String guests, String checkIn, String checkOut) throws IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");

            String query = "insert into booking_details(guestName,noOfGuests,checkInDate,checkOutDate) values (?,?,?,?)";

            final PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, guestName);
            ps.setString(2, guests);
            ps.setString(3, checkIn);
            ps.setString(4, checkOut);

            i = ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        if (i > 0) {

            return true;
        } else {
            return false;
        }
    }

    static boolean AdminLogin(String username, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");

            final PreparedStatement stmt = conn.prepareStatement("select * from admin_login where userName = ? and userPassword = ?");

            stmt.setString(1, username);
            stmt.setString(2, password);
            final ResultSet rs = stmt.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.out.println("Error : " + e.toString());
        }
        return status;
    }
    
    static ResultSet Search(){
        
        ResultSet rs = null;
        try{
         Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");
            String sql = "select * from available_rooms where flag = 0";
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }catch(Exception e ){
            
        }

        return rs;
    } 

    static boolean UpdateRooms(String room_no, String room_type, String room_capacity, String room_price) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
            System.out.println("Connection Sucessfull");
            String sql = "update available_rooms set roomNo=?,roomType=?,roomCapacity=?,roomPrice=? where roomNo=" + room_no;
            System.out.println(sql);
            final PreparedStatement ps;
            ps = conn.prepareStatement(sql);
            ps.setString(1, room_no);
            ps.setString(2, room_type);
            ps.setString(3, room_capacity);
            ps.setString(4, room_price);

            i = ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }
}
