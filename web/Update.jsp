<%-- 
    Document   : Update
    Created on : 18 Sep, 2020, 2:00:11 PM
    Author     : karnika
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String roomNo = request.getParameter("roomNo");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "hotel_reservation";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from available_rooms where roomNo=" + roomNo;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Room Details</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
         
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Update Room Details</h1>
        <form method="post" action="UpdateProcessServlet">
            <div class="container">
                <label for="roomnumber"><b>Room Number</b></label><br>
                <input type="text" name="roomnumber" value="<%=resultSet.getString("roomNo")%>">
            <br>
                <label for="roomtype"><b>Room Type</b></label><br>
                <select name="roomtype">
                            <option value="<%=resultSet.getString("roomType")%>"><%=resultSet.getString("roomType")%></option>
                            <option name='standard' value="Standard">Standard</option>
                            <option name='deluxe' value="Deluxe">Deluxe</option>
                            <option name='luxury' value="Luxury">Luxury</option>
                        </select>
            <br>
            
                <label for="roomcapacity"><b>Room Capacity</b></label><br>
            
            <input type="text" name="roomcapacity" value="<%=resultSet.getString("roomCapacity")%>">
            <br>
                <label for="roomprice"><b>Room Price</b></label><br>
           
            <input type="text" name="roomprice" value="<%=resultSet.getString("roomPrice")%>">
            <br><br>
            
            <button type="submit" style='color: white'>Update</button><br><br>
           
            </div>
        </form>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>