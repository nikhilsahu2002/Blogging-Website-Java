/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NIKHIL
 
*/
@WebServlet("/getEmail")
public class admin extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the user's email from wherever you have it stored (e.g., session attribute)
        String userEmail = (String) request.getSession().getAttribute("loggedInUserEmail");

        // Set the email as a request attribute to pass it to the JSP page
        request.setAttribute("userEmail", userEmail);

        // Forward the request to the JSP page for displaying the email
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}