import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SubmitFeedback")
public class SubmitFeedback extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

   

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "1234");

            // Prepare the SQL query to insert the feedback data into the feedback table
            String insertQuery = "INSERT INTO feedback (name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, subject);
            pstmt.setString(4, message);

            // Execute the query to insert the data
            int rowsInserted = pstmt.executeUpdate();
            
            // Close the PreparedStatement and database connection
            pstmt.close();
            con.close();

            // You may want to redirect the user to a thank you page after submission
            response.sendRedirect("thankyou.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            // Handle the exception as needed, e.g., display an error page to the user
            response.sendRedirect("error.jsp");
        }
    }
}
