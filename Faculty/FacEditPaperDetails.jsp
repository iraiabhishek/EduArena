<%-- 
    Document   : FacEditQuestionPaper
    Created on : Apr 10, 2019, 4:34:39 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="faculty.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap ud=(HashMap)session.getAttribute("Facdata");
    if(ud!=null){
%>
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
	</nav>
	</br></br>
        
        <div class="container">
            <section>
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="panel panel-default">
                            <%
                                DBConnect db=(DBConnect)application.getAttribute("db");
                                if(db==null){
                                    db=new DBConnect();
                                    application.setAttribute("db",db);
                                }
                                PreparedStatement QPD=db.getQPDetails();
                                QPD.setString(1, (String)ud.get("email"));
                                QPD.setString(2, (String)ud.get("paperid"));
                                ResultSet rs=QPD.executeQuery();
                                String pprid=request.getParameter("ed");
                                if(rs.next()){
                            %>
                            <div class="panel-heading text-center">
                                <hr><h3><b>PAPER DETAILS</b></h3><hr>
                                <form action="../PaperEditDetails" method="post" class="form-horizontal">
                                    <div class="row col-lg-offset-0">
                                        <div class="form-group col-lg-6">
                                            <label for="name" class="col-lg-4 control-label">Name:</label>
                                            <div class="col-lg-8">
                                                <label for="name" class="control-label"><%=rs.getString(1) %></label>
                                            </div>
                                        </div><!--end form group-->
                                        <div class="form-group col-lg-6">
                                            <label for="email" class="col-lg-4 control-label">Email:</label>
                                            <div class="col-lg-8">
                                                <label for="email" class="control-label"><%=rs.getString(2) %></label>
                                            </div>
                                        </div><!--end form group-->
                                    </div>
                                    <div class="row col-lg-offset-0">
                                        <div class="form-group col-lg-6">
                                                <label for="degree" class="col-lg-4 control-label">Graduation:</label>
                                                <div class="col-lg-8">
                                                    <select class="form-control" id="gd" name="gd"></select>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group col-lg-6">
                                                <label for="department" class="col-lg-4 control-label">Departments:</label>
                                                <div class="col-lg-8">
                                                    <select class="form-control" name="dp" id="dp"></select>
                                                </div>
                                            </div><!--end form group-->
                                            <script language="javascript">
                                                populateCourses("gd", "dp");
                                                populateCourses("gd");
                                            </script>
                                    </div>
                                    <div class="row col-lg-offset-0">
                                        <div class="form-group col-lg-6">
                                            <label for="subject" class="col-lg-4 control-label">Subject:</label>
                                            <div class="col-lg-8">
                                                <input type="text" pattern="*[A-Za-z]" class="form-control" name="sub" id="sub" placeholder="Subject name"/>
                                            </div>
                                        </div><!--end form group-->
                                        <div class="form-group col-lg-6">
                                            <label for="totq" class="col-lg-4 control-label">Questions:</label>
                                            <div class="col-lg-8">
                                                <input type="text" pattern="*[0-9]" class="form-control" name="totq" id="totq" placeholder="Number of Questions"/>
                                            </div>
                                        </div><!--end form group-->
                                    </div>
                                    <div class="row col-lg-offset-0">
                                        <div class="form-group col-lg-6">
                                            <label for="stexam" class="col-lg-4 control-label">Start:</label>
                                            <div class="col-lg-8">
                                                <input type="datetime-local" pattern="*[0-9]" class="form-control" name="stexam" id="tottime" placeholder="Mins"/>
                                            </div>
                                        </div><!--end form group-->
                                        <div class="form-group col-lg-6">
                                            <label for="enexam" class="col-lg-4 control-label">End:</label>
                                            <div class="col-lg-8">
                                                <input type="datetime-local" class="form-control" name="enexam" id="enexam" placeholder="Time and date of exam"/>
                                            </div>
                                        </div><!--end form group-->
                                    </div>
                                    <hr>
                                    <div col="row">
                                        <div class="form-horizontal">    
                                            <div class="col-lg-offset-0">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                    <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                                </div>						
                                            </div>
                                        </div>
                                    </div><hr>
                                </form>
                            </div>
                                <%
                                    }
                                %>
                        </div><br><br>
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