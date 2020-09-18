<%-- 
    Document   : search
    Created on : 18 Sep, 2020, 12:04:07 PM
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
        <title>Search Availability</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            button{
                margin-left: 510px;
                background-color: black;
                padding: 10px;
                width: 30%;
                color: white;
            }
        </style>
    </head>
    <body>
        <form action="SearchServlet" method="get">
        <div class="tables" style="font-size: 20px;font-family: serif">
             <div class="row" style=" text-align: center; background-color: black;opacity: 1.2;margin-top: 10px;color: white">
                    <div class="col-md-6" >
                        <label for='check_in_date'>Select Check-in date</label><br>
                        <input type="date" name="check_in_date" style=" color: black" required/>
                    </div>
                    <!--<p>Select Check-out date</p><br><br>-->
                    <div class="col-md-4" >
                        <label for='check_out_date'>Select Check-out date</label><br>
                        <input type="date" name="check_out_date" style=" color: black" required/>
                    </div>            
                </div>
            
            <div class="row" style=" text-align: center; background-color: black;opacity: 1.2; color: white">
                <button style=" margin-top: 20px;margin-bottom: 20px">Search</button>
            </div>
             </form>

            
            <h1 class="title1" style="text-align: center;margin-bottom: 10px;font-style: bold;margin-top: 20px">Available Rooms</h1>
                        <div class="panel-body widget-shadow" style=" margin-left: 110px">
                            <div style="overflow-x:auto;">
                                <table border="5" style="font-family: 'serif'; width: 80%; text-align: center">
                                    <tr style="background-color: black; color: white">
                                        <td style="padding: 15px">Room No.</td>
                                        <td style="padding: 15px">Room Type</td>
                                        <td style="padding: 15px">Room Capacity</td>
                                        <td style="padding: 15px">Room Price</td>
                                        <td style="padding: 15px">Book</td>
                                    </tr>
                                    <%
                                        try{
                                        ResultSet rs = (ResultSet)request.getAttribute("Result");
                            while (rs.next()) {%>
                                    <tr>
                                        <td style="padding: 15px"><%= rs.getString("roomNo")%></td>
                                        <td style="padding: 15px"><%= rs.getString("roomType")%></td>
                                        <td style="padding: 15px"><%= rs.getString("roomCapacity")%></td>
                                        <td style="padding: 15px"><%= rs.getString("roomPrice")%></td>
                                        <td style="padding: 15px"><a href="Home.jsp">Book</td>
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
