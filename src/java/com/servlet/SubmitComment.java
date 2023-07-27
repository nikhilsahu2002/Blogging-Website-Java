package com.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubmitComment")
public class SubmitComment extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String headline = request.getParameter("headline");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String content = request.getParameter("content");
        Date postedDate = new Date(); // You can use a more sophisticated method to get the date

        // You can now process and store the comment data as needed
        // For this example, let's assume we have a method to insert the comment into the database
        insertCommentIntoDatabase(headline, name, email, content, postedDate);

        // Redirect the user back to the dynamic_page.jsp to display the updated comments
        response.sendRedirect("dynamic_page.jsp?headline=" + URLEncoder.encode(headline, "UTF-8"));
    }

    private void insertCommentIntoDatabase(String headline, String name, String email, String content, Date postedDate) {
        // Your database connection details
        String driverName = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/form";
        String username = "root";
        String password = "1234";

        try {
            // Load the JDBC driver
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(connectionUrl, username, password);

            // Prepare the SQL query to insert the comment data into the comments table
            String insertQuery = "INSERT INTO comments (headline, name, email, content, posted_date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, headline);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, content);
            pstmt.setTimestamp(5, new java.sql.Timestamp(postedDate.getTime()));

            // Execute the query to insert the data
            int rowsInserted = pstmt.executeUpdate();

            // Close the PreparedStatement and database connection
            pstmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            // Handle the exception as needed, e.g., display an error page to the user
        }
    }
}
