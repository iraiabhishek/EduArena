<%-- 
    Document   : AspCourses
    Created on : Apr 7, 2019, 11:30:09 PM
    Author     : Abhishek Rai
--%>

<%@page import="aspirant.DBConnect"%>
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
                <a class="navbar-brand" href="index.jsp">EduArena</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            HashMap ud=(HashMap)session.getAttribute("Aspdata");
                            if(ud!=null){
                            %>      
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand"><%=ud.get("name")%> <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="table-responsive table-dark" href="AspProfile.jsp">Profile</a></li>
                                        <li><a class="table-responsive table-dark" href="RegisteredExams.jsp">Registered Exams</a></li>
                                        <li><a class="table-responsive table-dark" href="../Logout">Logout</a></li>
                                    </ul>
                                </div>
                            <%
                            }else{
                            %>
                                <div class="dropdown pull-right">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle navbar-brand">Login<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a class="table-responsive table-dark" href="AspLogin.jsp">Aspirant</a></li>
                                        <li><a class="table-responsive table-dark" href="../Faculty/FacLogin.jsp">Faculty</a></li>
                                        <li><a class="table-responsive table-dark" href="../Admin/AdmLogin.jsp">Admin</a></li>
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
        <div class="container">
            <section>
                <%
                    try{
                        DBConnect db=(DBConnect)application.getAttribute("db");
                        if(db==null){
                            db=new DBConnect();
                            application.setAttribute("db",db);
                        }
                        int c=0,n=0,temp,m;
                        Statement stmt=db.getSt();
                        HashMap eapp=new HashMap();
                        ResultSet rs1=stmt.executeQuery("Select paperid from EXAMAPPLICANTS where email='"+(String)ud.get("email")+"' ");
                        while(rs1.next()){
                            ++n;// It will tell that for how many courses current aspirant registered
                            eapp.put("p"+n+"", rs1.getInt(1));// Storing all the paper id's into hashmap
                        }
                        ResultSet rs=stmt.executeQuery("Select * from facultypaperdetails where ready='YES'");
                        while(rs.next())
                        {
                    %>
                <div class="row">
                    <!--Left Side-->
                    <div class="col-lg-6">
                        <div class="panel panel-default panel-primary">
                            <div class="panel-heading text-center">
                                <h3><%=rs.getString(5) %></h3>
                            </div>
                            <div class="panel-body">
                                <hr>
                                <form method="post" class="form-horizontal">
                                    <div class="form-group col-lg-12">
                                        <label for="degree" class="col-lg-4 control-label">Graduation:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(3)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="department" class="col-lg-4 control-label">Departments:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(4)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="totq" class="col-lg-4 control-label">Questions:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(6)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="std" class="col-lg-4 control-label">Start date:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(7).replace(".0", "")%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="edt" class="col-lg-4 control-label">Last date:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(8).replace(".0", "")%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <%
                                        temp=n ;// temp is used to run the loop
                                        m=0;
                                        while(temp!=0){
                                            m++;
                                             if(((int)eapp.get("p"+m+""))==rs.getInt(9)){
                                                 c=1;//Aspirant is registered for this course
                                                 break;
                                             }
                                             temp--;
                                        }
                                        if(c!=1)
                                        {
                                            //If not registerd for this course
                                    %>
                                            <div class="form-horizontal col-lg-12 col-lg-offset-5">    
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary" name="apply" formaction="../applyExam" value=<%=rs.getString(9)%> >Apply</button>
                                                    </div>						
                                                </div>
                                            </div>
                                    <%
                                        }else{
                                            //If registerd
                                    %>   
                                            <div class="form-horizontal col-lg-12 col-lg-offset-5">    
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <button type="submit" disabled class="btn btn-primary" name="apply" formaction="applyExam" value=<%=rs.getString(9)%> >Registered</button>
                                                    </div>						
                                                </div>
                                            </div>
                                    <%
                                            c=0;
                                        }
                                    %>
                                </form>
                            </div><hr>
                        </div>
                    </div>
                            <%
                                if(rs.next()){
                            %>
                    <!--Right Side-->
                    <div class="col-lg-6">
                        <div class="panel panel-default panel-primary">
                            <div class="panel-heading text-center">
                                <h3><%=rs.getString(5)%></h3>
                            </div>
                            <div class="panel-body">
                                <hr>
                                <form action="../LoginProcess" method="post" class="form-horizontal">
                                    <div class="form-group col-lg-12">
                                        <label for="degree" class="col-lg-4 control-label">Graduation:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(3)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="department" class="col-lg-4 control-label">Departments:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(4)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="totq" class="col-lg-4 control-label">Questions:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(6)%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="std" class="col-lg-4 control-label">Start date:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(7).replace(".0", "")%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group col-lg-12">
                                        <label for="edt" class="col-lg-4 control-label">Last date:</label>
                                        <div class="col-lg-8">
                                            <h5><%=rs.getString(8).replace(".0", "")%></h5>
                                        </div>
                                    </div><!--end form group-->
                                    <%
                                        temp=n ;// temp is used to run the loop
                                        m=0;
                                        while(temp!=0){
                                            m++;
                                             if(((int)eapp.get("p"+m+""))==rs.getInt(9)){
                                                 c=1;
                                                 break;
                                             }
                                             temp--;
                                        }
                                        if(c!=1)
                                        {
                                            //If not registerd
                                    %>
                                            <div class="form-horizontal col-lg-12 col-lg-offset-5">    
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary" name="apply" formaction="../applyExam" value=<%=rs.getString(9)%> >Apply</button>
                                                    </div>						
                                                </div>
                                            </div>
                                    <%
                                        }else{
                                            //If registerd
                                    %>   
                                            <div class="form-horizontal col-lg-12 col-lg-offset-5">    
                                                <div class="form-group">
                                                    <div class="form-group">
                                                        <button type="submit" disabled class="btn btn-primary" name="apply" formaction="applyExam" value=<%=rs.getString(9)%> >Registered</button>
                                                    </div>						
                                                </div>
                                            </div>
                                    <%
                                            c=0;
                                        }
                                    %>        
                                </form>
                            </div><hr>
                        </div>
                    </div>                        
                            <%
                                }
                            %>
                </div><br/><br/>
                    <%            
                        }
                        eapp.clear();
                    }catch(Exception ex){
                        session.setAttribute("msg","Please login first !");
                        response.sendRedirect("../errorpage.jsp");
                    }
                    %>
            </section>
        </div>
        <!--end of Features-->
        <hr>
        <br><br><br>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>