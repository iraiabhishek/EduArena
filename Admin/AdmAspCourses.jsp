<%-- 
    Document   : AdmAspCourses
    Created on : 20 Jun, 2022, 11:29:57 AM
    Author     : 28arc
--%>

<%@page import="admin.DBConnect"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <link href="../bootstrap/css/forgetpassword.css" rel="stylesheet">
        <style>
            body {
              background-image: url('../bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <!--navigation bar-->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid ">
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
                            HashMap ud=(HashMap)session.getAttribute("Admdata");
                            if(ud!=null){
                            %>      
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="AdmProfile.jsp">Profile</a></li>
                                        <li><a href="AdmFacList.jsp">Faculty List</a></li>
                                        <li><a href="AdmAspList.jsp">Aspirant List</a></li>
                                        <li><a href="../LogoutAdm">Logout</a></li>
                                    </ul>
                                </div>
                            <%
                            }else{
                            %>
                                   <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand">Login<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="../Aspirant/AspLogin.jsp">Aspirant</a></li>
                                        <li><a href="../Faculty/FacLogin.jsp">Faculty</a></li>
                                        <li><a href="AdmLogin.jsp">Admin</a></li>
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
        <hr>
        <div class="container-fluid">
            <section>
                <div class="row col-lg-12">
                    <div class="panel panel-default panel-primary">
                        <div class="panel-heading text-center">
                            <h3>COURSES</h3>
                        </div>
                        <div class="panel-body">
                <%
                    try{
                        DBConnect db=(DBConnect)application.getAttribute("db");
                        if(db==null){
                            db=new DBConnect();
                            application.setAttribute("db",db);
                        }
                        int c=0,n=0,temp,m;
                        String em="";
                        Statement stmt=db.getSt();
                        HashMap eapp=new HashMap();
                        ResultSet rs1=stmt.executeQuery("Select * from facultypaperdetails where email='"+(String)ud.get("email")+"' ");
                        while(rs1.next()){
                            ++n;
                            em=rs1.getString(2);
                            eapp.put("p"+n+"", rs1.getInt(1));
                        }
                        %>
                            <form method="post" >
                            <table border="1px" cellpadding="5px" cellspacing="0px" width="100%" class="text-center">
                                <tr>
                                    <td><b>PAPER ID</b></td>
                                    <td><b>GRADUATION</b></td>
                                    <td><b>DEPARTMENT</b></td>
                                    <td><b>SUBJECT</b></td>
                                    <td><b>NAME</b></td>
                                    <td><b>EMAIL</b></td>
                                    <td><b>QUES</b></td>
                                    <td><b>START TIME</b></td>
                                    <td><b>END TIME</b></td>
                                    <td><b>READY</b></td>
                                    <td><b>DELETE</b></td>
                                </tr>
                        <%
                            ResultSet rs=stmt.executeQuery("Select * from facultypaperdetails");
                            while(rs.next())
                            {
                        %>
                                <tr>
                                    <td><%=rs.getInt(9)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(6)%></td>
                                    <td><%=rs.getString(7).replace(".0", "")%></td>
                                    <td><%=rs.getString(8).replace(".0", "")%></td>
                                    <td><%=rs.getString(10)%></td>
                                    <td><button type="submit" class="btn btn-danger" name='pid' formaction="../DeleteCourses" onclick="return confirm('Click on OK button to delete this question paper,recorded reponses of applicants, registered applicant records and applicants results.');" value=<%=rs.getInt(9)%> >GO</button></td>
                                </tr>
<!--                                <script>
                                    function deleteCourse(){
                                        window.alert("Click on 'OK' button to delete this question paper, recorded reponses of applicants, registered applicant records and applicants results.");
                                        window.prompt("Click on 'OK' button to delete this question paper, recorded reponses of applicants, registered applicant records and applicants results.");
                                        window.confirm("Click on 'OK' button to delete this question paper, recorded reponses of applicants, registered applicant records and applicants results.");
                                        window.location.href="AdmAspCourses.jsp";
                                    }    
                                </script>-->
                        <%
                            }
                        %>
                            </table>
                            </form>
                    <%
                    }catch(Exception ex){
                        session.setAttribute("msg","Please login first !");
                        response.sendRedirect("../errorpage.jsp");
                    }
                    %>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--end of Features-->
        <hr>
        <br><br><br>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>