/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author karnika
 */
public class UpdateProcessServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("UpdateProcess");
        PrintWriter out = response.getWriter();
        String room_no = request.getParameter("roomnumber");
        String room_type = request.getParameter("roomtype");
        String room_capacity = request.getParameter("roomcapacity");
        String room_price = request.getParameter("roomprice");

        if (DaoClass.UpdateRooms(room_no, room_type, room_capacity, room_price)) {
            out.println("<script type='text/javascript'>alert('Details updated!')</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Admin_Rooms_Fetch.jsp");
            rd.include(request, response);
        } else {
            out.println("<script type='text/javascript'>alert('There is a problem in updating Record!')</script>");

        }

    }
}
