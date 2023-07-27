import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(maxFileSize = 16177215)
public class StudentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String studentClass = request.getParameter("class");
        String headline = request.getParameter("headline");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        InputStream inputStream = null; // input stream of the upload file
        
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // Replace database_url, username, and password with your database credentials
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/form", "root", "1234");

            // Insert the student data into the database
            String insertQuery = "INSERT INTO students (name, class, headline, description, date, photo) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, studentClass);
            pstmt.setString(3, headline);
            pstmt.setString(4, description);
            pstmt.setString(5, date);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pstmt.setBlob(6, inputStream);
            }
 
            // sends the statement to the database server
            int row = pstmt.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
            pstmt.close();
            con.close();

            // Redirect to a success page after successful data submission
            response.sendRedirect("success.jsp");

        } catch (ClassNotFoundException | SQLException ex) {
            response.getWriter().println("ERROR: An error occurred while processing the request. Please try again later.");
            ex.printStackTrace(); // This will print the stack trace of the exception to the server log
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
