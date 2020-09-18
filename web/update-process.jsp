<%-- 
    Document   : update-process
    Created on : 18 Sep, 2020, 2:35:45 PM
    Author     : karnika
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/hotel_reservation";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String room_no = request.getParameter("roomNo");
    String room_type = request.getParameter("roomType");
    String room_capacity = request.getParameter("roomCapacity");
    String room_price = request.getParameter("roomPrice");

    if (room_no != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int RoomNumber = Integer.parseInt(room_no);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update available_rooms set roomNo=?,roomType=?,roomCapacity=?,roomPrice=? where roomNo=" + room_no;
            ps = con.prepareStatement(sql);
            ps.setString(1, room_no);
            ps.setString(2, room_type);
            ps.setString(3, room_capacity);
            ps.setString(4, room_price);

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<script type='text/javascript'>alert('Details updated!')</script>");
                RequestDispatcher rd = request.getRequestDispatcher("Admin_Rooms_Fetch.jsp");
                rd.include(request, response);
            } else {
                out.println("<script type='text/javascript'>alert('There is a problem in updating Record!')</script>");
              
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
