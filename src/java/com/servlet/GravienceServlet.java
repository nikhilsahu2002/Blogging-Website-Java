package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GravienceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String content = request.getParameter("content");
        String dateCreated = request.getParameter("date_created");
        String authorId =request.getParameter("author_id");

        try {
            // Replace database_url, username, and password with your database credentials
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "1234");

            // Insert the gravience data into the database
            String insertQuery = "INSERT INTO gravience (content, date_created, author_id) VALUES (?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, content);
            pstmt.setString(2, dateCreated);
            pstmt.setString(3, authorId);
            pstmt.executeUpdate();
            pstmt.close();

            con.close();

            // Redirect to a success page after successful data submission
            response.sendRedirect("success.jsp");

        } catch (ClassNotFoundException | SQLException ex) {
            response.getWriter().println("ERROR: An error occurred while processing the request. Please try again later.");
            ex.printStackTrace(); // This will print the stack trace of the exception to the server log
        }
    }
}
