<%-- 
    Document   : FacPapers
    Created on : Mar 18, 2019, 2:56:51 PM
    Author     : Abhishek Rai
--%>

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
        
        <div class="container-fluid">
            <section>
                <div class="row">
                    <%--Left side--%>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h3>NEW PAPER INFORMATION</h3>
                            </div>
                            <div class="panel-body text-left">
                                <hr><form action="../PaperDetailSet" method="post" class="form-horizontal">
                                    <div class="row col-lg-offset-1">
                                        <div class="form-group col-lg-6">
                                            <label for="name" class="col-lg-4 control-label">Name:</label>
                                            <div class="col-lg-8">
                                                <input type="text" readonly class="form-control" name="name" id="name" placeholder=<%=ud.get("name")%> />
                                            </div>
                                        </div><!--end form group-->
                                        <div class="form-group col-lg-6">
                                            <label for="email" class="col-lg-4 control-label">Email:</label>
                                            <div class="col-lg-8">
                                                <input type="email" readonly class="form-control" name="email" id="email" placeholder=<%=ud.get("email")%> />
                                            </div>
                                        </div><!--end form group-->
                                    </div>
                                    <div class="row col-lg-offset-1">    
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
                                    <div class="row col-lg-offset-1">
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
                                    <div class="row col-lg-offset-1">
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
                                    </div><hr>
                                    <div col="row">
                                        <div class="form-horizontal">    
                                            <div class="col-lg-offset-5">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success">Save</button>
                                                    <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                                </div>						
                                            </div>
                                        </div>
                                    </div>
                                </form><hr>                                
                            </div>
                        </div><br><br>
                    </div>
                    <%--Right side--%>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h3>EXAM PAPERS</h3>
                            </div>
                            <div class="panel-body text-left">
                                <hr><form action="" class="form-horizontal">
                                    <div class="row col-lg-offset-1">
                                        <%
                                            DBConnect db=(DBConnect)application.getAttribute("db");
                                            if(db==null){
                                                db=new DBConnect();
                                                application.setAttribute("db",db);
                                            }
                                            PreparedStatement QPD=db.getCheckQPD();
                                            QPD.setString(1, (String)ud.get("email"));
                                            ResultSet rs=QPD.executeQuery();
                                            int i=0;
                                            while(rs.next()){
                                                i++;
                                        %>
                                            <div class="col-lg-1">
                                                <div class="form-group">
                                                    <label for="papernum" class="control-label"><b><%=i%>. </b></label>
                                                </div><!--end form group-->
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="form-group">
                                                    <label for="degree" class="control-label"><b><%=rs.getString(5) %></b></label>
                                                </div><!--end form group-->
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <button type="submit" value=<%=rs.getInt(9)%> name="sbt" class="btn btn-warning" formaction="../PaperCreate">Edit</button>
                                                </div>						
                                            </div><br/>
                                        <%
                                            }
                                        %>
                                    </div>
                                </form><hr>
                            </div>
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