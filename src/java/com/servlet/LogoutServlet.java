package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the current session (if one exists)
        HttpSession session = request.getSession(false);

        // Invalidate the session if it exists
        if (session != null) {
            session.invalidate();
        }

        // Redirect the user to the login page after logout
        response.sendRedirect("/Form");
    }
}
 