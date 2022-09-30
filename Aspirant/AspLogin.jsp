<%-- 
    Document   : LogStudent
    Created on : Mar 16, 2019, 1:21:26 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
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
        <style>
            body {
              background-image: url('../bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <!--navigation bar-->
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
                    <%
                        HashMap ud=(HashMap)session.getAttribute("Aspdata");
                        if(ud!=null){
                    %>
                            <li><a href="AspProfile.jsp"><%=ud.get("name")%></a></li>
                            <li><a href="../Logout">Logout</a><li>
                    <%
                        }else{
                    %>
                            <%--
                                <li><a class="navbar-brand" href="AspRegister.jsp">Student[+]</a></li>
                            --%>
                            <div class="dropdown pull-right">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand">Login<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="AspLogin.jsp">Aspirant</a></li>
                                    <li><a href="../Faculty/FacLogin.jsp">Faculty</a></li>
                                    <li><a href="../Admin/AdmLogin.jsp">Admin</a></li>
                                </ul>
                            </div>
                    <%
                        }
                    %>
                    </ul>			
                </div>
            </div>
	</nav>
                
        <!--Features-->
        <br><br><br><hr>
        <div class="container">
            <section>
                <div class="row">
                <!--Right Side-->
                    <div class="col-lg-6 col-lg-offset-3">
                        <div class="panel panel-default panel-info">
                            <div class="panel-heading text-center">
                                <h3>ASPIRANT LOGIN</h3>
                            </div>
                            <div class="panel-body">
                                <form action="../LoginProcess" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="email" class="col-lg-3 control-label">Email:</label>
                                        <div class="col-lg-9">
                                            <input type="email" pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control" name="email" id="email" placeholder="Enter your email"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="password" class="col-lg-3 control-label">Password:</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" name="pass" id="password" 
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="must contain 8 or more characters that are of at least one number, and one uppercase and lowercase letter." placeholder="Enter your password"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <button type="submit" class="btn btn-primary">Login</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <a href="../forgetpassword.jsp">Forget Password ?</a> | <a href="AspRegister.jsp">Sign Up</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
                <hr>
        <!--end of Features-->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>