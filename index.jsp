<%-- 
    Document   : index
    Created on : Apr 5, 2019, 5:15:28 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>EduArena</title>
        <link rel="icon" href="bootstrap/img/EA.ico" type="image/x-icon">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/forgetpassword.css" rel="stylesheet">
        <style>
            body {
              background-image: url('bootstrap/img/bg.jpg');
            }
        </style>
    </head>


    <body id="page-top">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
            <div class="container-fluid ">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="index.jsp" class="navbar-brand">EduArena</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            HashMap ud=(HashMap)session.getAttribute("Aspdata");
                            if(ud!=null){
                        %>      
                                    <div class="dropdown pull-right">
                                        <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a class="table-responsive table-dark" href="Aspirant/AspProfile.jsp">Profile</a></li>
                                            <li><a class="table-responsive table-dark" href="Aspirant/AspCourses.jsp">Courses</a></li>
                                            <li><a class="table-responsive table-dark" href="Aspirant/RegisteredExams.jsp">Registered Exams</a></li>
                                            <li><a class="table-responsive table-dark" href="Logout">Logout</a><li>
                                        </ul>
                                    </div>
                        <%
                            }else{
                            ud=(HashMap)session.getAttribute("Facdata");
                            if(ud!=null){
                        %>      
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="table-responsive table-dark" href="Faculty/FacProfile.jsp">Profile</a></li>
                                        <li><a class="table-responsive table-dark" href="Faculty/FacPapers.jsp">Exam Papers</a></li>
                                        <li><a class="table-responsive table-dark" href="LogoutFac">Logout</a><li>
                                    </ul>
                                </div>
                        <%
                            }else{
                            ud=(HashMap)session.getAttribute("Admdata");
                            if(ud!=null){
                        %>
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="table-responsive table-dark" href="Admin/AdmProfile.jsp">Profile</a></li>
                                        <li><a class="table-responsive table-dark" href="LogoutAdm">Logout</a><li>
                                    </ul>
                                </div>
                        <%
                            }else{
                        %>
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand">Login<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="table-responsive table-dark" href="Aspirant/AspLogin.jsp">Aspirant</a></li>
                                        <li><a class="table-responsive table-dark" href="Faculty/FacLogin.jsp">Faculty</a></li>
                                        <li><a class="table-responsive table-dark" href="Admin/AdmLogin.jsp">Admin</a></li>
                                    </ul>
                                </div>
                        <%
                            }
                            }
                            }
                        %>
                    </ul>
                </div>
            </div><!--end container-->
        </nav><!--end navbar-->
        
        <!-- About Section -->
        <section id="contact" class="content-section text-center">
          <div class="container">
            <div class="row">
                <h2 class="text-info">EDUARENA</h2>
                <b class="text-danger">EduArena - A Platform for Aspiring Geeks</b><br>
                EduArena was created as a platform to help geeks make it big in the world of algorithms, computer programming and other related technologies of computer science. At EduArena we work hard to revive the geek in you by hosting various smaller practice tests of various computer science subjects at the start of the month and two big tests at the middle and end of the month. We also aim to have training sessions and discussions related to computer science technicalities. Apart from providing a platform for geek competitions, EduArena will also provide discussions forum to help those who are new to the world of computers.
            </div>
          </div>
        </section>
        <br><br><br><br>

        <!-- Contact Section -->
        <section id="contact" class="content-section text-center">
          <div class="container">
            <div class="row">
                <h2 class="text-info">Contact us</h2>
                <b class="text-danger">ABHISHEK RAI</b><br>
                <b class="text-danger">Address (Office-Main) : </b>PG Hostel, MNNIT Allahabad, Prayagraj, Uttar Pradesh - 211004<br>
                <b class="text-danger">Address (Office) : </b>Raman Hostel, MNNIT Allahabad, Prayagraj, Uttar Pradesh - 211004<br>
                <b class="text-danger">E-Mail Id      : </b>eduarena@gmail.com<br>
                <b class="text-danger">Mobile No      : </b>+91 9599476868<br>
            </div>
          </div>
        </section>
        <br><br><br><br>

        <!-- Map Section 
        <div id="googleMap" style="width:100%;height:400px;"></div>
        <script>
        function myMap() {
        var mapProp= {
          center:new google.maps.LatLng(51.508742,-0.120850),
          zoom:5,
        };
        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
        }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=myMap"></script>
        -->
        
        <!--footer-->	
        <div class="navbar navbar-inverse navbar-fixed-bottom">
            <div class="container-fluid ">
                <div class="navbar-text pull-left">
                    <p>Design and Develop by Abhishek Rai.</p>
                </div>
                <div class="navbar-fixed-bottom col-lg-offset-5">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-google"></a>
                    <a href="#" class="fa fa-linkedin"></a>
                    <a href="#" class="fa fa-instagram"></a>
                </div>
                <div class="navbar-text pull-right">
                    <p>Copyright &copy; EduArena 2018</p>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>

</html>
