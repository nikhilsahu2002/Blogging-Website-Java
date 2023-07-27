

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
    body{
    
}

.top-image {
    background-image: url('https://img.freepik.com/free-photo/copy-space-italian-food-ingredients_23-2148551732.jpg');
    background-repeat: no-repeat;
    background-size: cover;

    width: 100%;
    height: 300px; /* Adjust the height as needed */
}

.bottom-image {
    background-image: url('https://img.freepik.com/free-photo/copy-space-italian-food-ingredients_23-2148551732.jpg');
    background-repeat: no-repeat;
    background-size: cover;

    width: 100%;
    height: 200px; /* Adjust the height as needed */
}
h2{
    color: rgb(14, 41, 41);
    font-size: large;

}


header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #e9b3b3;
    color: #000000;
    padding: 20px;
}

.brand {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.brand h1 {
    margin: 0;
    
}
nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
}

nav li {
    margin-left: 10px;
    font-size: 20px;
}

nav a {
    color: #000000;
    text-decoration: none;
    padding: 10px;
}

.cards {
    position: relative;
    width: 250px;
    height: 400px;
    background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT8xrAGdoi2OTGH198ttrMQJg8lHC4Gl4n-2XjG7d-9A&s');
    /* background: linear-gradient(-45deg, #f89b29 0%, #ff0f7b 100% ); */
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
  }
  
  .cards svg {
    width: 48px;
    fill: #333;
    transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
  }
  
  .cards:hover {
    transform: rotate(0deg) scale(1.1);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  }
  
  .card__content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) rotate(-45deg);
    width: 100%;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;
    background-color: #fff;
    opacity: 0;
    transition: all 0.6s cubic-bezier(0.23, 1, 0.320, 1);
  }
  
  .cards:hover .card__content {
    transform: translate(-50%, -50%) rotate(0deg);
    opacity: 1;
  }
  
  .card__title {
    margin: 0;
    font-size: 24px;
    color: #333;
    font-weight: 700;
  }
  
  .card__description {
    margin: 10px 0 0;
    font-size: 14px;
    color: #777;
    line-height: 1.4;
  }
  
  .card:hover svg {
    scale: 0;
    transform: rotate(-45deg);
  }
  

</style>
    </head>
    <body>
        <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- Container wrapper -->
  <div class="container-fluid">
    <!-- Toggle button -->
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Navbar brand -->
      <a class="navbar-brand mt-2 mt-lg-0" href="/Form">
        <img
          src="data:image/png;base64,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"
          height="30"
        
          alt="MDB Logo"
          loading="lazy"
        />
      </a>
      <!-- Left links -->
      <%-- Check if the user is logged in --%>
<% String userEmail = (String) session.getAttribute("loggedInUserEmail"); %>
<% if (userEmail == null) { %>
    <!-- User not logged in, display login and register links -->
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link" href="login">Login</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="signup">Register</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="post">Post</a>
        </li>
    </ul>
<% } else { %>
    <!-- User logged in, display user's email -->
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link" href="post">Post</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="feedback">FeedBack</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="gravience">Grievance</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="article">Article</a>
        </li>
        
    </ul>
            <!-- Avatar -->
      <div class="dropdown">
        <a
          class="dropdown-toggle d-flex align-items-center hidden-arrow"
          href="#"
          id="navbarDropdownMenuAvatar"
          role="button"
          data-mdb-toggle="dropdown"
          aria-expanded="false"
        >
          <img
            src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
            class="rounded-circle"
            height="25"
            alt="Black and White Portrait of a Man"
            loading="lazy"
          />
        </a>
        <ul
          class="dropdown-menu dropdown-menu-end"
          aria-labelledby="navbarDropdownMenuAvatar"
        >
          <li>
            <a class="dropdown-item" href="admin">My profile</a>
          </li>
          <li>
            <a class="dropdown-item" href="logout">Logout</a>
          </li>
        </ul>
      </div>
<% } %>
      <!-- Left links -->
    
    <!-- Right elements -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->

    <div class="top-image"></div>
    <div>
      <center>
        <div style="padding: 100px">
          <h1 style="font-size: larger; font-family: monospace">
            LATEST BLOG POSTS
          </h1>
        </div>
        <div class="container text-center">
          <div class="row align-items-start">
            <div class="col">
              <div class="card" style="width: 20rem">
                <img
                  src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80"
                  class="card-img-top"
                  alt="..."
                />
                <div class="card-body">
                  <h2>Food</h2>
                  <h3>10 FOOD That Will Take On The Ride</h3>
                  <p class="card-text">
                    Some quick example text to build on the card title and make
                    up the bulk of the card's content.
                  </p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card" style="width: 20rem">
                <img
                  src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80"
                  class="card-img-top"
                  alt="..."
                />
                <div class="card-body">
                  <h2>Food</h2>
                  <h3>10 FOOD That Will Take On The Ride</h3>
                  <p class="card-text">
                    Some quick example text to build on the card title and make
                    up the bulk of the card's content.
                  </p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card" style="width: 20rem">
                <img
                  src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80"
                  class="card-img-top"
                  alt="..."
                />
                <div class="card-body">
                  <h2>Food</h2>
                  <h3>10 FOOD That Will Take On The Ride</h3>
                  <p class="card-text">
                    Some quick example text to build on the card title and make
                    up the bulk of the card's content.
                  </p>
                </div>
              </div>
            </div>
            <div style="padding: 5px"></div>
          </div>
        </div>
      </center>

      <center>
        <div style="padding: 100px">
          <h1 style="font-size: larger; font-family: monospace">
            BEST RESTAURANTS TO VISITBEST RESTAURANTS TO VISIT
          </h1>
        </div>
        <div class="container text-center">
          <div class="row align-items-start">
            <div class="col">
              <div class="cards">
                <svg
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                ></svg>
                <div class="card__content">
                  <p class="card__title">Card Title</p>
                  <p class="card__description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco.
                  </p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="cards">
                <svg
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                ></svg>
                <div class="card__content">
                  <p class="card__title">Card Title</p>
                  <p class="card__description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco.
                  </p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="cards">
                <svg
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                ></svg>
                <div class="card__content">
                  <p class="card__title">Card Title</p>
                  <p class="card__description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco.
                  </p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="cards">
                <svg
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                ></svg>
                <div class="card__content">
                  <p class="card__title">Card Title</p>
                  <p class="card__description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                    do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                    ullamco.
                  </p>
                </div>
              </div>
            </div>
            <div style="padding: 5px"></div>
          </div>
        </div>
        <div style="padding: 20px"></div>
      </center>
      <center>
        <div style="padding: 20px; margin-top: 20px">
          <h1 style="font-size: larger; font-family: monospace">
            FEATURED REVIEW VIDEOS
          </h1>
          <p style="width: 600px; height: 200px; margin-top: 10px">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quae
            soluta ipsa distinctio ea, ipsam consequatur! Quam assumenda
            reprehenderit, hic repellendus consectetur totam? Suscipit quidem
            repellendus porro mollitia magnam earum sit.
          </p>
        </div>
        <div class="container text-center">
          <div class="row align-items-start">
            <div class="col">
              <div class="card" style="width: 30rem">
                <iframe
                  height="315"
                  src="https://www.youtube.com/embed/b80CWbrdUrs"
                  title="YouTube video player"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen
                ></iframe>

                <div class="card-body">
                  <h3 class="card-text">
                    The Perfect Summer Fruit Salad For your Energy
                  </h3>
                  <div>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card" style="width: 30rem">
                <iframe
                  height="315"
                  src="https://www.youtube.com/embed/b80CWbrdUrs"
                  title="YouTube video player"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen
                ></iframe>

                <div class="card-body">
                  <h3 class="card-text">
                    The Perfect Summer Fruit Salad For your Energy
                  </h3>
                  <div>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                  </div>
                </div>
              </div>
            </div>
            <div style="padding: 5px; margin-bottom: 20px"></div>
          </div>
        </div>
      </center>
    </div>

    <div class="bottom-image"></div>
    <footer class="bg-dark text-center text-white">
      <!-- Grid container -->
      <div class="container p-4 pb-0">
        <!-- Section: Social media -->
        <section class="mb-4">
          <!-- Facebook -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-facebook-f"></i></a>
  
          <!-- Twitter -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-twitter"></i></a>
  
          <!-- Google -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-google"></i></a>
  
          <!-- Instagram -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-instagram"></i></a>
  
          <!-- Linkedin -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-linkedin-in"></i></a>
  
          <!-- Github -->
          <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"><i class="fab fa-github"></i></a>
        </section>
        <!-- Section: Social media -->
      </div>
      <!-- Grid container -->
  
      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2023 Copyright: Shivangi Agrawal
        
      </div>
      <!-- Copyright -->
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
></script>

    </body>
</html>
