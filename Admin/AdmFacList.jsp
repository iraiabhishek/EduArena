<%-- 
    Document   : AdmFacList
    Created on : Apr 13, 2019, 5:34:48 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="admin.DBConnect"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HashMap ud=(HashMap)session.getAttribute("Admdata");
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
                                <li><a href="AdmProfile.jsp">Profile</a></li>
                                <li><a href="AdmAspList.jsp">Aspirant List</a></li>
                                <li><a href="../LogoutAdm">Logout</a></li>
                            </ul>
                        </div>
                    </ul>			
                </div>
            </div>
	</nav><!-- end of navbar-->
		
        <div class="container">
            <section>
                <div class="panel panel-default panel-danger">
                    <div class="panel-heading text-center">
                        <h3>FACULTY LIST</h3>
                    </div>
                    <div class="panel-body"></br></br>
                        <form method="post" class="form-horizontal">
                            <div class="row">
                            <%
                                DBConnect db=(DBConnect)application.getAttribute("db");
                                if(db==null){
                                    db=new DBConnect();
                                    application.setAttribute("db",db);
                                }
                                Statement stmt=db.getSt();
                                ResultSet rs=stmt.executeQuery("Select name,email from facultylist");
                            %>
                            <table border="1px" cellpadding="5px" cellspacing="0px" width="80%" class="col-lg-offset-1 text-center">
                                    <tr>
                                        <td><b>S.No.</b></td>
                                        <td><b>Faculty Name</b></td>
                                        <td><b>Faculty Email</b></td>
                                        <td><b>Profile</b></td>
                                    </tr>
                            <%
                                    int i=0;
                                    while(rs.next()){
                            %>
                                        <tr>
                                            <td><%=++i%></td>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><button type="submit" formaction="../AspFacProfile" class="btn btn-default" name='view' value=<%=rs.getString(2)%> >View</button></td>
                                        </tr>
                            <%
                                    }
                            %>
                            </table>
                            </div>
                            <br><br>
                        </form>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-5">
                                <button type="" class="btn btn-primary" onclick="history.back()" >Back</button>
                            </div>
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