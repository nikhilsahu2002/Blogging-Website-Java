<%@page import="com.servlet.ImageEncoder"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/form";
String username = "root";
String password = "1234";

try {
    Class.forName(driverName);
    Connection con = DriverManager.getConnection(connectionUrl, username, password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM students");
    
     Statement commentStmt = con.createStatement();
    ResultSet commentRs = commentStmt.executeQuery("SELECT * FROM comments");
    
     Statement ad = con.createStatement();
   ResultSet ads = ad.executeQuery("SELECT * FROM feedback");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
  rel="stylesheet"
/>
<style>
    .des{
        font-size: 10px;
    }
</style>
    </head>
    <body>
        <section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/Form">Home</a></li>
            <li class="breadcrumb-item"><a>User</a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <% String userEmails = (String) session.getAttribute("loggedInUserEmail"); %>
            <% if (userEmails != null) { %>
                <h5 class="text-muted mb-0"><%= userEmails %></h5>
            <% } else { %>
                <p class="text-muted mb-1">Full Stack Developer</p>
                <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                <div class="d-flex justify-content-center mb-2">
                  <button type="button" class="btn btn-primary">Follow</button>
                  <button type="button" class="btn btn-outline-primary ms-1">Message</button>
                </div>
            <% } %>
          </div>
        </div>
        <div class="card mb-4 mb-lg-0">
          <div class="card-body p-0">
            <ul class="list-group list-group-flush rounded-3">
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fas fa-globe fa-lg text-warning"></i>
                <p class="mb-0">https://mdbootstrap.com</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                <p class="mb-0">@mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                <p class="mb-0">mdbootstrap</p>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <% String userEmail = (String) session.getAttribute("loggedInUserEmail"); %>
                <% if (userEmail != null) { %>
                    <p class="text-muted mb-0"><%= userEmail %></p>
                <% } else { %>
                    <p class="text-muted mb-0">Johnatan Smith</p>
                    <!-- Any default content or message for when the user is not logged in -->
                <% } %>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">example@example.com</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">(097) 234-5678</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">(098) 765-4321</p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
  <div class="card mb-4 mb-md-0">
    <div class="card-body">
      <h5 class="card-title">User Posts</h5>
      <div class="table-responsive">
        <table class="table table-sm table-bordered">
          <thead>
            <tr>
              <th style="font-size: 14px;">Image</th>
              <th style="font-size: 14px;">Headline</th>
              <th style="font-size: 14px;">Description</th>
            </tr>
          </thead>
          <tbody>
            <% while (rs.next()) {
                 String headline = rs.getString("headline");
                 String description = rs.getString("description");
                 Blob photoBlob = rs.getBlob("photo");
                 String base64Image = ImageEncoder.encodeImageToBase64(photoBlob);
            %>
            <tr>
              <td style="font-size: 12px;">
                <% if (base64Image != null) { %>
                  <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Article Image" style="width: 40px; height: 40px; border: 1px solid black; border-radius: 5px;">
                <% } %>
              </td>
              <td style="font-size: 12px;"><%= headline %></td>
              <td style="font-size: 12px;"><%= description %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

          <div class="col-md-6">
  <div class="card mb-4 mb-md-0">
    <div class="card-body">
      <h5 class="card-title">Comments</h5>
      <!-- Add your comments here -->
      <div class="table-responsive">
        <table class="table table-sm table-bordered">
          <thead>
            <tr>
              <th style="font-size: 14px;">Headline</th>
              <th style="font-size: 14px;">Name</th>
              <th style="font-size: 14px;">Email</th>
              <th style="font-size: 14px;">Content</th>
              <th style="font-size: 14px;">Posted Date</th>
            </tr>
          </thead>
          <tbody>
            <% while (commentRs.next()) {
                 String headline = commentRs.getString("headline");
                 String name = commentRs.getString("name");
                 String email = commentRs.getString("email");
                 String content = commentRs.getString("content");
                 String posted = commentRs.getString("posted_date");
            %>
            <tr>
              <td style="font-size: 12px;"><%= headline %></td>
              <td style="font-size: 12px;"><%= name %></td>
              <td style="font-size: 12px;"><%= email %></td>
              <td style="font-size: 12px;"><%= content %></td>
              <td style="font-size: 12px;"><%= posted %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<div class="row mt-4">
    <div class="col-md-12">
        <div class="card mb-4 mb-md-0">
            <div class="card-body">
                <h5 class="card-title">User Feedback</h5>
                <div class="table-responsive">
                    <table class="table table-sm table-bordered">
                        <thead>
                            <tr>
                                <th style="font-size: 14px;">Feedback ID</th>
                                <th style="font-size: 14px;">Name</th>
                                <th style="font-size: 14px;">Email</th>
                                <th style="font-size: 14px;">Subject</th>
                                <th style="font-size: 14px;">Message</th>
                                <th style="font-size: 14px;">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (ads.next()) {
                                int feedback_id = ads.getInt("feedback_id");
                                String name = ads.getString("name"); // Change rs to ads
                                String email = ads.getString("email"); // Change rs to ads
                                String subject = ads.getString("subject"); // Change rs to ads
                                String message = ads.getString("message"); // Change rs to ads
                                String date = ads.getString("submission_date"); // Change rs to ads
                            %>
                            <tr>
                                <td style="font-size: 12px;"><%= feedback_id %></td>
                                <td style="font-size: 12px;"><%= name %></td>
                                <td style="font-size: 12px;"><%= email %></td>
                                <td style="font-size: 12px;"><%= subject %></td>
                                <td style="font-size: 12px;"><%= message %></td>
                                <td style="font-size: 12px;"><%= date %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

        </div>
      </div>
    </div>
  </div>
</section>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
></script>
</body>
</html>

<%
} catch (Exception e) {
    e.printStackTrace();
}
%>
