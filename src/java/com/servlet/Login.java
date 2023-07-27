package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("name");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "1234");

                // Check if the user's email and password match an existing record in the database
                String checkQuery = "SELECT * FROM users WHERE name = ? AND password = ?";
                PreparedStatement checkPstmt = con.prepareStatement(checkQuery);
                checkPstmt.setString(1, name);
                checkPstmt.setString(2, password);
                ResultSet resultSet = checkPstmt.executeQuery();

//                if (resultSet.next()) {
//                    // Login successful
//                    out.println("<h1>Login Successful</h1>");
//                      request.setAttribute("loginSuccess", "Login SuccessFul.");
//                } else {
//                    // Login failed
//                    request.setAttribute("loginError", "Login Failed. Please check your email and password.");
//                }
//                
                // Check if the user's email and password match an existing record in the database

if (resultSet.next()) {
    // Login successful
    String userEmail = resultSet.getString("name");

    // Store the user's email in the session
    HttpSession session = request.getSession();
    session.setAttribute("loggedInUserEmail", userEmail);
    request.setAttribute("loginSuccess", "Login Successful.");

    // Redirect the user to the home page
    response.sendRedirect("/Form");
} else {
    // Login failed
    request.setAttribute("loginError", "Login Failed. Please check your email and password.");

    // Forward the request and response back to the login page
    RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
    dispatcher.forward(request, response);
}

// Close connections
checkPstmt.close();
con.close();

               

            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                out.println("ERROR: " + ex.getMessage());
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
