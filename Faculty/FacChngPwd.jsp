<%-- 
    Document   : FacChngPwd
    Created on : Mar 17, 2019, 2:53:15 AM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HashMap ud=(HashMap)session.getAttribute("Facdata");
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
        <link href="bootstrap/css/forgetpassword.css" rel="stylesheet">
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
                                <li><a href="FacProfile.jsp">Profile</a></li>
                                <li><a href="FacPapers.jsp">Exam Papers</a></li>
                                <li><a href="../LogoutFac">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav><!-- end of navbar-->
        <br/><br/><br/><br/>
		
        <div class="container">
            <section>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3>CHANGE PASSWORD</h3>
                    </div>
                    <div class="panel-body"><br/>
                        <form action="../ChngPwdFac" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="crntpwd" class="col-lg-2 control-label">Current Password:</label>
                                <div class="col-lg-10">
                                    <input type="password" class="form-control" name="crntpwd" id="oldpwd" placeholder="Enter current password"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <label for="newpwd" class="col-lg-2 control-label">New Password:</label>
                                <div class="col-lg-10">
                                    <input type="password" class="form-control" name="newpwd1" id="newpwd" 
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="must contain 8 or more characters that are of at least one number, and one uppercase and lowercase letter." placeholder="Enter a new password"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <label for="confirmpwd" class="col-lg-2 control-label">Confirm Password:</label>
                                <div class="col-lg-10">
                                    <input type="password" class="form-control" name="newpwd2" id="confirmpwd" placeholder="Confirm new password"/>
                                </div>
                            </div><!--end form group-->
                            <br/>
                            <div class="form-group">
                                <div class="col-lg-3 col-lg-offset-5">
                                    <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <button type="reset" class="btn btn-primary">Reset</button>
                                </div>
                            </div><!--end form group-->
                        </form>
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