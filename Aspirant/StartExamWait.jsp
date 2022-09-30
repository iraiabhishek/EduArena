<%-- 
    Document   : StartExamWait
    Created on : Apr 16, 2019, 12:42:09 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="aspirant.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HashMap ud=(HashMap)session.getAttribute("Aspdata");
    if(ud!=null){
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>EduArena</title>
        <link rel="icon" href="../bootstrap/img/EA.ico" type="image/x-icon">
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../bootstrap/css/custom.css" rel="stylesheet">
        <script src="../bootstrap/js/courses.js"></script>
        <link href="../bootstrap/css/forgetpassword.css" rel="stylesheet">
        <style>
            body {
              background-image: url('../bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.jsp">EduArena</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="dropdown pull-right">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="AspProfile.jsp">Profile</a></li>
                                <li><a href="AspCourses.jsp">Courses</a></li>
                                <li><a href="RegisteredExams.jsp">Registered Exams</a></li>
                                <li><a href="../Logout">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav><!-- end of navbar-->
		
        <br><br>
        <div class="container">
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="panel panel-default panel-info">
                        <div class="panel-heading text-center">
                            <h3><b>TIME TO START EXAM</b></h3>
                        </div><br>
                        <div class="panel-body">
                            <form action="ExamStarted.jsp" method="post" class="form-horizontal">
                                <%
                                    int paperid=Integer.valueOf((String)ud.get("paperid"));
                                    int crno=0;
                                    DBConnect db=(DBConnect)application.getAttribute("db");
                                    if(db==null){
                                        db=new DBConnect();
                                        application.setAttribute("db",db);
                                    }
                                    //Count total number of questions
                                    Statement stmt=db.getSt();
                                    String QPName="QPN"+paperid;
                                    ResultSet rs=stmt.executeQuery("select stexam from facultypaperdetails where paperid='"+paperid+"' ");
                                    rs.next();
                                    //Gives time in millisecs since 1, 1970, 00:00:00 GMT
                                    Long st=rs.getTimestamp(1).getTime();
                                %>
                                <div class="panel panel-body panel-danger" >
                                    <input type="Number" id="examdt" hidden value=<%=st%> />
                                    <h1 class="text-center col-lg-8 col-lg-offset-2" color='white'><div id="demo"></div></h1>
                                </div>
                                <div class="form-group">
                                    <div class="text-center ">
                                        <button type="submit" disabled="disabled" class="btn btn-dark" id="sendNewSms" >START EXAM</button>
                                    </div>
                                </div><!--end form group-->

                                <script>
                                    // Set the date we're counting down to
                                    var countDownDate=document.getElementById("examdt").value;
                                    // Update the count down every 1 second
                                    var x = setInterval(function() {

                                            // Get todays date and time
                                            var now = new Date().getTime();

                                            // Find the distance between now and the count down date
//                                                var distance = countDownDate - now;
                                            var distance = countDownDate-now;


                                            // Time calculations for days, hours, minutes and seconds
                                            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                            // Output the result in an element with id="demo"
                                            document.getElementById("demo").innerHTML = hours + "H :" + minutes + "M :" + seconds + "S";

                                            // If the count down is over, write some text 
                                            if (distance < 0) {
                                              clearInterval(x);
                                              document.getElementById("demo").innerHTML = "Ready to Start";
                                            }
                                            
                                            //Start button
                                            var sendbtn=document.getElementById('sendNewSms');
                                            if(distance<0)
                                                sendbtn.disabled=false;
                                            else
                                                sendbtn.disabled=true;
                                            //End
                                            
                                            
                                          }, 1000);
                                </script>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
	</div>
	
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("../index.jsp");
    }
%>