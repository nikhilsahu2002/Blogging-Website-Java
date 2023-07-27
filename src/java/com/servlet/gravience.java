package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

@WebServlet("/gravience")
public class gravience extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the post.jsp without changing the URL
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/gravience_form.jsp");
        dispatcher.forward(request, response);
    }
}
