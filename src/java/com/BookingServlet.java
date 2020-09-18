/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author karnika
 */
public class BookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
//             request.getSession(false).getAttribute("currentSessionUser").toString()

            String guestName = (String) request.getSession(false).getAttribute("currentSessionUser");
            String guests = request.getParameter("guests");
            Calendar d1 = Calendar.getInstance();
            Calendar d2 = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date checkIn1 = formatter.parse(request.getParameter("check_in_date"));
            java.util.Date checkOut1 = formatter.parse(request.getParameter("check_out_date"));
            d1.setTime(checkIn1);
            d2.setTime(checkOut1);
            int diff = d2.get(Calendar.DAY_OF_MONTH) - d1.get(Calendar.DAY_OF_MONTH);
            if (diff < 0) {
                System.out.println("IF");
                out.println("<script type='text/javascript'>alert('Please enter valid dates!')</script>");
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                rd.include(request, response);
            } //            java.sql.Date checkInSql = new java.sql.Date(checkIn.getTime());
            //            java.sql.Date checkOutSql = new java.sql.Date(checkOut.getTime());
            //            
            else {
                String checkIn = request.getParameter("check_in_date");
                String checkOut = request.getParameter("check_out_date");
                if (DaoClass.Book(guestName, guests, checkIn, checkOut)) {
                    // out.println("<script type='text/javascript'>alert('Your reservations has been made successfully!\nHappy holidays!')</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>alert('Sorry, this reservation has been failed!\nPlease try again in sometimes...')</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                    rd.include(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
