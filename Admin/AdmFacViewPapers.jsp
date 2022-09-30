<%-- 
    Document   : AdmFacViewPapers
    Created on : Apr 14, 2019, 3:26:25 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="admin.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap aspfac=(HashMap)session.getAttribute("aspfac");            
    HashMap ud=(HashMap)session.getAttribute("Admdata");            
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
                                <li><a href="AdmProfile.jsp">Profile</a></li>
                                <li><a href="AdmFacList.jsp">Faculty List</a></li>
                                <li><a href="AdmAspList.jsp">Aspirant List</a></li>
                                <li><a href="../LogoutAdm">Logout</a></li>
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
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="panel panel-default panel-danger">
                            <%
                                DBConnect db=(DBConnect)application.getAttribute("db");
                                if(db==null){
                                    db=new DBConnect();
                                    application.setAttribute("db",db);
                                }
                                int paperid=Integer.valueOf(request.getParameter("sbt"));
                                String QPName="QPN"+paperid;
                                Statement stmt=db.getSt();
                                ResultSet rs=stmt.executeQuery("Select SUB from facultypaperdetails where paperid='"+paperid+"' ");;
                                rs.next();
                                String sub=rs.getString(1);
                                rs=stmt.executeQuery("Select * from "+QPName+"");
                            %>
                            <div class="panel-heading text-center">
                                <h2><b><%=sub.toUpperCase() %></b></h2>
                            </div>
                            <%
                                while(rs.next()){
                            %>
                            <div class="panel-body text-left panel-danger">
                                <div class="panel panel-heading panel-default panel-warning">
                                    <form action="#" method="post" class="form-horizontal">
                                        <div class="panel panel-heading panel-default panel-warning">
                                            <div class="form-group">
                                                <label for="question" class="col-lg-1 control-label">Q.No.<%=rs.getString(5)%>: </label>
                                                <div class="col-lg-10">
                                                    <h5><%=rs.getString(6)%></h5>
                                                </div>
                                                <div class="col-lg-1">
                                                    <h5><b><%=rs.getString(12)%> Mark</b></h5>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="answers" class="col-lg-1 control-label">Options:</label><br/><br/>
                                                <div class="row col-lg-10 col-lg-offset-1">
                                                    <h5 class="col-lg-5">(A) <%=rs.getString(7)%></h5>
                                                    <h5 class="col-lg-5 col-lg-offset-1">(B) <%=rs.getString(8)%></h5>
                                                </div>
                                                <div class="row col-lg-10 col-lg-offset-1">
                                                    <h5 class="col-lg-5">(C) <%=rs.getString(9)%></h5>
                                                    <h5 class="col-lg-5 col-lg-offset-1">(D) <%=rs.getString(10)%></h5>
                                                </div>
                                            </div><!--end form group-->
                                            <div class="form-group">
                                                <label for="cropt" class="col-lg-1 control-label">Answer:</label>
                                                <label for="cropt" class="col-lg-3 control-label"> <%=rs.getString(11)%></label>
                                            </div><!--end form group-->
                                        </div>
                                    </form>
                                </div>                                
                            </div>
                            <%
                                }
                            %>
                            <hr/>
                            <div class="form-group">
                                <div class="col-lg-1 col-lg-offset-5">
                                    <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                                </div>
                            </div>
                            <br/><br/><hr/>
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