package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Get parameters from the request
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");

            // Check if the password and repassword are the same
            if (!password.equals(repassword)) {
                // Passwords do not match, display an error message
                request.setAttribute("loginError", "Passwords do not match.");
                request.getRequestDispatcher("signup").forward(request, response);
                return; // Stop further processing to avoid inserting invalid data into the database
            }

            // Establish the database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "1234");

            // Check if the email (username) is already registered
            String checkQuery = "SELECT * FROM users WHERE email = ?";
            PreparedStatement checkPstmt = con.prepareStatement(checkQuery);
            checkPstmt.setString(1, email);
            ResultSet resultSet = checkPstmt.executeQuery();

            if (resultSet.next()) {
                // User is already registered with this email (username)
                request.setAttribute("loginError", "Email already exists.");
                request.getRequestDispatcher("signup").forward(request, response);
            } else {
                // Check if the name (user) is already registered
                String checkUserQuery = "SELECT * FROM users WHERE name = ?";
                PreparedStatement checkUserPstmt = con.prepareStatement(checkUserQuery);
                checkUserPstmt.setString(1, name);
                ResultSet userResultSet = checkUserPstmt.executeQuery();

                if (userResultSet.next()) {
                    // User is already registered with this name
                    request.setAttribute("loginError", "User already exists.");
                    request.getRequestDispatcher("signup").forward(request, response);
                } else {
                    // User is not registered, proceed with registration
                    String insertQuery = "INSERT INTO users (name, email, password, repassword) VALUES (?, ?, ?, ?)";
                    PreparedStatement pstmt = con.prepareStatement(insertQuery);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, password);
                    pstmt.setString(4, repassword);
                    pstmt.executeUpdate();
                    pstmt.close();

                    // Set the loginSuccess attribute and redirect to the Login page
                    request.setAttribute("loginSuccess", "Registration Successful.");
                    response.sendRedirect("Login"); // Corrected URL to "Login"
                }

                // Close user connections
                checkUserPstmt.close();
                userResultSet.close();
            }

            // Close connections
            checkPstmt.close();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            out.println("ERROR: " + ex.getMessage());
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
