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
public class RegistrationServlet extends HttpServlet {

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
        try {
            final PrintWriter out = response.getWriter();

            response.setContentType("text/html;charset=UTF-8");

            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("psw");
            
            if (DaoClass.Register(uname, email, contact,password)) {
                    out.println("<script type='text/javascript'>alert('You have registered successfully!!')</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("index.htm");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>alert('Oops! Please enter valid data to register!')</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
                    rd.include(request, response);
                }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}


