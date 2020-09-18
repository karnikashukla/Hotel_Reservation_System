<%-- 
    Document   : Admin_Rooms_Fetch
    Created on : 18 Sep, 2020, 1:48:28 PM
    Author     : karnika
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Room Details</title>

        <link href="//fonts.googleapis.com/css?family=Mukta:200,300,400,500,600,700,800" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .topnav-right{
                float: right;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light" >
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto" style=" font-size: 20px">
                    <li class="nav-item ">
                        <a class="nav-link" href="AdminHome">Home  |</a>
                    </li>
                    <li class="nav-item active" style=" font-size: 20px">
                        <a class="nav-link" href="Admin_Rooms_Fetch.jsp">Room Details |<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active" style=" font-size: 20px">
                        <a class="nav-link" href="Admin_Login.jsp">Logout</a>
                    </li>
            </div>
        </nav>
        <div class="tables" style="font-size: 20px;font-family: serif">
            <h1 class="title1" style="text-align: center;margin-bottom: 10px;font-style: bold;margin-top: 20px">Total Rooms</h1>
            <div class="panel-body widget-shadow" style=" margin-left: 110px">
                <div style="overflow-x:auto;">
                    <table border="5" style="font-family: 'serif'; width: 80%; text-align: center">
                        <tr style="background-color: black; color: white">
                            <td style="padding: 15px">Room No.</td>
                            <td style="padding: 15px">Room Type</td>
                            <td style="padding: 15px">Room Capacity</td>
                            <td style="padding: 15px">Room Price</td>
                            <td style="padding: 15px">Update</td>
                        </tr>
                        <%
                            Connection conn = null;
                            int count = 0;
                            //setting the connection
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_reservation?serverTimezone=UTC", "root", "");
                                System.out.println("Connection Sucessfull");
                                Statement stmt = conn.createStatement();
                                String sql = "select * from available_rooms";
                                ResultSet rs = stmt.executeQuery(sql);
                                while (rs.next()) {%>
                        <tr>
                            <td style="padding: 15px"><%= rs.getString("roomNo")%></td>
                            <td style="padding: 15px"><%= rs.getString("roomType")%></td>
                            <td style="padding: 15px"><%= rs.getString("roomCapacity")%></td>
                            <td style="padding: 15px"><%= rs.getString("roomPrice")%></td>
                            <td style="padding: 15px"><a href="Update.jsp?roomNo=<%=rs.getString("roomNo")%>">Update</td>
                        </tr>

                        <% }
                            } catch (Exception e) {
                                System.out.println("Error : " + e.toString());
                            }
                        %>
                    </table>
                </div>

   </body>
</html>